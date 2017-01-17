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

int main  (int argc, char *argv[])
{
    struct timeval t_Start, t_End;
    unsigned long time = 0;
    unsigned long i = 0, j = 0;
    unsigned long N = 0, N1 = 0;
    unsigned int repetitions = 0;

    N = SCALE * ARRAY_SIZE;
    repetitions = ITERATIONS;

    printf("No. of Elements : %dM\nRepetitions = %d\n", SCALE, repetitions);
    printf("Start allocating buffers and initializing ....\n");

    printf ("SERIAL\n");

    // AoS
    // Quadratic Equation: a*x^2 + b*x + c = 0
    struct Coefficients {
        float a;
        float b;
        float c;
    } coefficients;

    struct Roots {
        float x1;
        float x2;
    } roots;

    struct Coefficients ** Coef_set=0;
    struct Roots ** Root_set=0;
    
    Coef_set = (struct Coefficients **) malloc(N * sizeof(struct Coefficients *));
    Root_set = (struct Roots **) malloc(N * sizeof(struct Roots *));
    
    for (i=0; i<N; i++)
    {
        Coef_set[i] = (struct Coefficients *) malloc(sizeof(struct Coefficients));

        Coef_set[i]->a = 0;
        Coef_set[i]->b = 0;
        Coef_set[i]->c = 0;
        
        Root_set[i] = (struct Roots *) malloc(sizeof(struct Roots));

        Root_set[i]->x1 = 0;
        Root_set[i]->x2 = 0;
    }

    // Initialize the arrays
    for (i=0; i<N; i++)
    {
        Coef_set[i]->a = (float)(i % 64) + 1.0;
        Coef_set[i]->b = (float)(i % 64) + 101.0;
        Coef_set[i]->c = (float)(i % 32) - 33.0;

        Root_set[i]->x1 = 0;
        Root_set[i]->x2 = 0;
    }


#ifdef VERIFYING
    for (i=0; i<16; i++)
        result(i, Coef_set[i]->a, Coef_set[i]->b, Coef_set[i]->c, 
           Root_set[i]->x1, Root_set[i]->x2);
#endif

    gettimeofday(&t_Start, NULL);
    
    for(j=0; j<repetitions; j++)
    {
        for (i=0; i<N; i++)
        {
            Root_set[i]->x1 = (- Coef_set[i]->b + sqrt((pow(Coef_set[i]->b, 2) - 
                (4*Coef_set[i]->a*Coef_set[i]->c)))) / (2*Coef_set[i]->a); 
            Root_set[i]->x2 = (- Coef_set[i]->b - sqrt((pow(Coef_set[i]->b, 2) - 
                 (4*Coef_set[i]->a*Coef_set[i]->c)))) / (2*Coef_set[i]->a); 
        }
    }

    gettimeofday(&t_End, NULL);
    time += ((t_End.tv_sec - t_Start.tv_sec)*1000L +(t_End.tv_usec - t_Start.tv_usec)/1000L); 
    printf("Elapsed time in msec: %ld (after %d iterations)\n", time, ITERATIONS);

#ifdef VERIFYING
    int K = 100;
    for (i = 0; i < K; i++)
        result(i, Coef_set[i]->a, Coef_set[i]->b, Coef_set[i]->c, 
           Root_set[i]->x1, Root_set[i]->x2);
    
    for (i = N-K; i < N; i++)
        result(i, Coef_set[i]->a, Coef_set[i]->b, Coef_set[i]->c, 
           Root_set[i]->x1, Root_set[i]->x2);
#endif 

    for (i = 0; i < N; i++)
    {
        free(Coef_set[i]);
        free(Root_set[i]);
    }
    
    free(Coef_set);
    free(Root_set);

   return 0;
}
