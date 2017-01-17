/*
 *  Copyright (c) 2016 Intel Corporation.
 *  Intel Corporation All Rights Reserved.
 *
 *  Portions of the source code contained or described herein and all documents related
 *  to portions of the source code ("Material") are owned by Intel Corporation or its
 *  suppliers or licensors.  Title to the Material remains with Intel
 *  Corporation or its suppliers and licensors.  The Material contains trade
 *  secrets and proprietary and confidential information of Intel or its
 *  suppliers and licensors.  The Material is protected by worldwide copyright
 *  and trade secret laws and treaty provisions.  No part of the Material may
 *  be used, copied, reproduced, modified, published, uploaded, posted,
 *  transmitted, distributed, or disclosed in any way without Intel's prior
 *  express written permission.
 *
 *  No license under any patent, copyright, trade secret or other intellectual
 *  property right is granted to or conferred upon you by disclosure or
 *  delivery of the Materials, either expressly, by implication, inducement,
 *  estoppel or otherwise. Any license under such intellectual property rights
 *  must be express and approved by Intel in writing.
*/
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include <math.h>

const long ARRAY_SIZE=1024*1024;
const long SCALE=512;
const long ITERATIONS=10;

float result(unsigned long i, float a, float b, float c, float x1, float x2)
{
    float result1 = a*x1*x1 + b*x1 + c;
    float result2 = a*x2*x2 + b*x2 + c;
 
    printf("%ld: a=%10.4f, b=%10.4f, c=%10.4f, x1=%10.4f, x2=%10.4f result1=%10.6f, result2=%10.6f\n", 
       i, a, b, c, x1, x2, result1, result2); 
}

void compute_roots(unsigned long vectorSize, unsigned long serial, float a[], float b[], float c[], float x1[], float x2[])
{
    unsigned long j = 0, i = 0;

    for (j=0; j<ITERATIONS; j++)
    {
#pragma omp parallel for simd
#pragma vector aligned
        for (i=0; i<serial; i++)   // Perform in parallel fashion
        {
            x1[i] = (- b[i] + sqrtf((b[i]*b[i] - 4.0f *a[i]*c[i])) ) / (2.0f*a[i]);   
            x2[i] = (- b[i] - sqrtf((b[i]*b[i] - 4.0f *a[i]*c[i])) ) / (2.0f*a[i]);   
        }
   
#pragma vector aligned
        for( i=serial; i<vectorSize; i++)
        {
            x1[i] = (- b[i] + sqrtf((b[i]*b[i] - 4.0f *a[i]*c[i])) ) / (2.0f*a[i]);   
            x2[i] = (- b[i] - sqrtf((b[i]*b[i] - 4.0f *a[i]*c[i])) ) / (2.0f*a[i]);   
        }
    }
    return;
}

int main  (int argc, char *argv[])
{
    struct timeval t_Start, t_End;
    unsigned long time = 0;
    unsigned long i = 0, j = 0;
    unsigned long N = 0, N1 = 0;
    unsigned int repetitions = 0;
    int numthreads;

    N = SCALE * ARRAY_SIZE;
    repetitions = ITERATIONS;

    printf("No. of Elements : %dM\nRepetitions = %d\n", SCALE, repetitions);
    printf("Start allocating buffers and initializing ....\n");

    float *coef_a  = (float *)_mm_malloc(N * sizeof(float), 64);
    float *coef_b  = (float *)_mm_malloc(N * sizeof(float), 64);
    float *coef_c  = (float *)_mm_malloc(N * sizeof(float), 64);
    float *root_x1 = (float *)_mm_malloc(N * sizeof(float), 64);
    float *root_x2 = (float *)_mm_malloc(N * sizeof(float), 64);

#pragma omp parallel 
#pragma omp master
    {
        int tid = omp_get_thread_num();
        numthreads = omp_get_num_threads();

        printf("thread num=%d\n", tid);
        printf("Initializing\r\n");
    
        // Assuming omp static scheduling, carefully limit the loop-size to N1 instead of N 
        N1 = ((N / numthreads)/16) * numthreads * 16;
        printf("numthreads = %d, N = %d, N1 = %d, num-iters in remainder serial loop = %d, parallel-pct = %f\n", numthreads, N, N1, N-N1, (float)N1*100.0/N);
    }

    // Initialize the arrays
#pragma omp parallel for simd
#pragma vector aligned
    for(i=0; i<N1; i++)
    {
        coef_a[i] = (float)(i % 64) + 1.0f;
        coef_b[i] = (float)(i % 64) + 101.0f;
        coef_c[i] = (float)(i % 32) - 33.0f;
        root_x1[i] = 0.0f;
        root_x2[i] = 0.0f;
    }

#pragma vector aligned
    for(i=N1; i<N; i++)
    {
        coef_a[i] = (float)(i % 64) + 1.0f;
        coef_b[i] = (float)(i % 64) + 101.0f;
        coef_c[i] = (float)(i % 32) - 33.0f;
        root_x1[i] = 0.0f;
        root_x2[i] = 0.0f;
    }

    printf("Starting Compute on %d threads\r\n", numthreads);

    gettimeofday(&t_Start, NULL);
    
    compute_roots(N, N1, coef_a, coef_b, coef_c, root_x1, root_x2);

    gettimeofday(&t_End, NULL);
    time += ((t_End.tv_sec - t_Start.tv_sec)*1000L +(t_End.tv_usec - t_Start.tv_usec)/1000L); 
    printf("Elapsed time in msec: %ld (after %d iterations)\n", time, ITERATIONS);

#ifdef VERIFYING
    int K = 100;
    for (i = 0; i < K; i++)
        result(i, coef_a[i], coef_b[i], coef_c[i], root_x1[i], root_x2[i]);
    
    for (i = N-K; i < N; i++)
        result(i, coef_a[i], coef_b[i], coef_c[i], root_x1[i], root_x2[i]);
#endif

    _mm_free(coef_a);
    _mm_free(coef_b);
    _mm_free(coef_c);
    _mm_free(root_x1);
    _mm_free(root_x2);

   return 0;
}
