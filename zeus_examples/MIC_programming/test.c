#include <stdio.h>
#include <stdlib.h>
#include <omp.h>
#include <math.h>
#include <string.h>
#include <time.h>



int main(int argc, char *argv[]) {

  int nprocs;
  int nthreads;

// pragma offload target(mic) 
# pragma omp parallel 
  {
    nthreads = omp_get_num_threads();
    nprocs = omp_get_num_procs();
  }

  printf("MIC Information\n");
  printf("===============\n");
  printf("NUM PROCS: %d\n", nprocs);
  printf("NUM THREADS: %d\n", nthreads);
  printf("\n");

# pragma omp parallel 
  {
    nthreads = omp_get_num_threads();
    nprocs = omp_get_num_procs();
  }

  printf("CPU Information\n");
  printf("===============\n");
  printf("NUM PROCS: %d\n", nprocs);
  printf("NUM THREADS: %d\n", nthreads);
  
}


