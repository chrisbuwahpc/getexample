/**
 * MKL Sample Program - Real
 *
 * BLAS level 2 operation
 * Linear Solve
 * Fourier Transform
 */

#include <stdio.h>
#include <stdlib.h>
#include "mkl.h"                        /* MKL Standard Lib */
#include "mkl_lapacke.h"                /* MKL LAPACK */
#include "fftw/fftw3.h"                 /* MKL FFTW3 */
#include "../inc/mkl_example.h"

#define M 4                             /* Number of Rows */
#define N 5                             /* Number of Cols */

int main() {
    /* define Matrix A and vectors y & x */
    double *A, *x, *y;
    A = (double*)calloc(M*N,sizeof(double));
    x = (double*)calloc(M,sizeof(double));
    y = (double*)calloc(M,sizeof(double));

    int i, j;
    /* initialize matrix A and vector x */
    for (i = 0; i < M; i++) {
        for (j = 0; j < N; j++ ) {
            if(i > (j-1)) {
                A[i*N+j] = (double)(i+j+2);
            }
        }
        x[i] = (double)(i+1);
    }

    /* print input matrix and vector */
    printf("Printing matrix A:\n");
    printMatrixR(A, M, N);
    printf("Printing vector b:\n");
    printVectorR(x, M);

    /*********** BLAS level 2 (alpha)A * x = (beta)Y *******
     * incy, incx: Value by which to incriment y & x
     * lda: Leading dimension of matrix A
     * alpha, beta: Values by which to scale A and y respectively
     */
    int lda = M;
    int incy = 1, incx = 1;
	double alpha = 1, beta = 1;

    /* do BLAS routine */
    cblas_dgemv(CblasRowMajor, CblasNoTrans, N, M, alpha, A, lda,
                x, incx, beta, y, incy);

    /* Print output vector */
    printf("A * x = y (y unknown):\n");
    printVectorR(y, M);

    /*********** Linear Solve (A * x = y) *************************
     * pivot: (output)
     */
    int pivot[M];

    /* Leading dimension of b, and number of columns in b */
    int ldx = 1;

    /* Do linear solve operation */
    LAPACKE_dgesv(LAPACK_ROW_MAJOR, M, 1, A, lda, pivot, y, ldx);

    printf("A * b = y (b unknown):\n");
    printVectorR(y, M);

    free(A);
    free(x);

    /*********** FFTW *****************************************/
    printf("Fourier Transform: \n");
    double input[4] = { 1.0, 1.0, 1.0, 1.0 };
    fftw_complex *data, *fft_result, *ifft_result;
    fftw_plan plan_forward, plan_backward;

    /* allocate memory */
    data = (fftw_complex*) fftw_malloc(sizeof(fftw_complex) * 4);
    fft_result = (fftw_complex*) fftw_malloc(sizeof(fftw_complex) *4);
    ifft_result = (fftw_complex*) fftw_malloc(sizeof(fftw_complex) * 4);

    /* create forward/backward plans */
    plan_forward = fftw_plan_dft_1d(4, data, fft_result, FFTW_FORWARD,
                                    FFTW_ESTIMATE);
    plan_backward = fftw_plan_dft_1d(4, fft_result, ifft_result, FFTW_BACKWARD,
                                     FFTW_ESTIMATE);
    /* populate data */
    for (i = 0; i < 4; i++) {
        data[i][0] = input[i];
        data[i][1] = 0.0;
    }

    /* execute forward transform */
    fftw_execute(plan_forward);

    for( i = 0; i < 4; i++) {
        fprintf( stdout, "fft_result[%d] = {%2.2f, %2.2f}\n",
                 i, fft_result[i][0], fft_result[i][1]);
    }

    /* execute backward transform */
    fftw_execute(plan_backward);
    for (i = 0; i < 4; i++) {
        fprintf(stdout, "ifft_result[%d] = {%2.2f, %2.2f}\n",
                i, ifft_result[i][0], ifft_result[i][0]);
    }

    /* free memory */
    fftw_destroy_plan( plan_forward );
    fftw_destroy_plan( plan_backward);
    fftw_free( fft_result );
    fftw_free( ifft_result );

    return EXIT_SUCCESS;
}
