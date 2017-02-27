/**
 * MKL Sample Program
 *
 * Helper functions
 */

void printMatrixC(const MKL_Complex16* a, const int rows, const int cols) {
    int i, j;
    for (i = 0; i < rows; i++ ) {
        for (j = 0; j < cols; j++) {
            printf("%6.2f + %6.2fi  ", a[i*cols+j].real, a[i*cols+j].imag);
        }
        printf("\n");
    }
    printf("\n");
}

void printVectorC(const MKL_Complex16* v, const int n) {
    int i;
    for(i = 0; i < n; i++) {
        printf("%6.2f + %6.2fi\n",v[i].real, v[i].imag);
    }
    printf("\n");
}

void printMatrixR(const double* a, const int rows, const int cols ) {
    int i, j;
    for (i = 0; i < rows; i++ ) {
        for (j = 0; j < cols; j++ ) {
            printf("%6.2f  ", a[i*cols+j]);
        }
        printf("\n");
    }
    printf("\n");
}

void printVectorR(const double* v, const int n ) {
    int i;
    for (i = 0; i < n; i++ ) {
        printf("%6.2f\n", v[i]);
    }
    printf("\n");
}
