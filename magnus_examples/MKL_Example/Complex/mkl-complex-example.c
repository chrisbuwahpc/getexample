/**
 * MKL Sample Program - Complex
 *
 * BLAS Level 2
 * Linear Solve
 * Eigenvalue Computation
 * Fourier Transform
 */

#include <stdio.h>
#include <stdlib.h>
#include "mkl.h"                        /* MKL Standard Lib */
#include "mkl_lapacke.h"                /* MKL LAPACK */
#include "fftw/fftw3.h"                 /* MKL FFTW3 */
#include "../inc/mkl_example.h"

#define M 4                             /* Number of rows */
#define N 5                             /* Number of columns */

int main(int arc, char **argv) {
    /****** BLAS Level 2 Computation *******************
     * (alpha)A * x = (beta)y
     */

    /* Define and initialize a matrix and some vectors */
    MKL_Complex16 *A, *x, *y;
    MKL_Complex16 alpha, beta;

    /* Every incx(y)-th element of x or y will be considered */
    int incx = 1, incy = 1;

    /* Leading dimension of A */
    int lda = M;

    alpha.real = 1.0; alpha.imag = beta.real = beta.imag = 0.0;

    A = (MKL_Complex16*)calloc(M*N, sizeof(MKL_Complex16));
    x = (MKL_Complex16*)calloc(M, sizeof(MKL_Complex16));
    y = (MKL_Complex16*)calloc(M, sizeof(MKL_Complex16));

    int i, j;
    for (i = 0; i < M; i++ ) {
        for (j = 0; j < N; j++ ) {
            if(i > (j-1)) {
                A[i*N+j].real = (double)(i+j+2);
                A[i*N+j].imag = 0.0;
            }
        }
        x[i].real = (double)(i+1);
        x[i].imag = (double)(i+1)*2.0;
    }

    printf("Print Matrix A\n");
    printMatrixC(A, M, N);
    printf("Print Vector x\n");
    printVectorC(x, M);

    /* Call complex matrix*vector function from MKL */
    cblas_zgemv(CblasRowMajor, CblasNoTrans, N, M, &alpha, A, lda,
                x, incx, &beta, y, incy);

    /* Print result */
    printf("A * x = y (y unknown); Printing y:\n");
    printVectorC(y, M);

    /****************** Linear Solve ******************************
     * A * x = y (x unknown)
     */
    int ldx = 1;                        /* Leading dimension of x */
    int pivot[M];

    /* Call linear solve operation */
    LAPACKE_zgesv(LAPACK_ROW_MAJOR, M, 1, A, lda, pivot, y, ldx);

    /* y overwritten with solution, print solution */
    printf("A * x = y (x unknown); Printing x:\n");
    printVectorC(y, M);

    free(A);
    free(x);

    /******************* Eigenvalue Computation *******************
     * (output) vRight/vLeft: Eigenvectors (left/right)
     * (output) w: Eigenvalues
     */

    /* Define a new sqare matrix and eigen output vectors/matrices */
    MKL_Complex16 *B, *w, *vRight, *vLeft;
    B = (MKL_Complex16*)calloc(M*M, sizeof(MKL_Complex16));
    vRight = (MKL_Complex16*)calloc(M*M, sizeof(MKL_Complex16));
    vLeft = (MKL_Complex16*)calloc(M*M, sizeof(MKL_Complex16));
    w = (MKL_Complex16*)calloc(M, sizeof(MKL_Complex16));

    for (i = 0; i < M; i++ ) {
        for (j = 0; j < M; j++ ) {
            if (i > (j-1)) {
                B[i*M+j].real = (double)(i+j+2);
                B[i*M+j].imag = 0.0;
            }
        }
    }

    printf("Printing matrix B:\n");
    printMatrixC(B, M, M);

    /* calculate eigenvalues and eigenvectors */
    LAPACKE_zgeev(LAPACK_ROW_MAJOR, 'V', 'V', M, B, M,
                  w, vLeft, M, vRight, M);

    /* print resulting eigenvalues */
    printf("Printing eigenvalues:\n");
    printVectorC(w, M);

    free(w);
    free(B);

    /***************** Fourier Transforms **************************/

    printf("FFTW operation:\n");
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

    plan_backward = fftw_plan_dft_1d(4, fft_result, ifft_result,
                                     FFTW_BACKWARD, FFTW_ESTIMATE);

    /* populate data */
    for (i = 0; i < 4; i++) {
        data[i][0] = input[i];
        data[i][1] = 0.0;
    }

    /* execute forward transform and print result */
    fftw_execute(plan_forward);

    for( i = 0; i < 4; i++) {
        fprintf( stdout, "fft_result[%d] = {%2.2f, %2.2f}\n",i,
                 fft_result[i][0], fft_result[i][1]);
    }

    /* execute backward transform and print result */
    fftw_execute(plan_backward);
    for (i = 0; i < 4; i++) {
        fprintf(stdout, "ifft_result[%d] = {%2.2f, %2.2f}\n", i,
                ifft_result[i][0], ifft_result[i][0]);
    }

    /* free memory */
    fftw_destroy_plan( plan_forward );
    fftw_destroy_plan( plan_backward);
    fftw_free( fft_result );
    fftw_free( ifft_result );

    return EXIT_SUCCESS;
}
