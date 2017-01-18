
PROGRAM HYBRID_HELLO
  
  USE omp_lib
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  
  ! OpenMPI variables:
  INTEGER :: rank, numprocs
  INTEGER :: ierror 
  INTEGER, dimension(MPI_STATUS_SIZE) :: status
  
  ! OpenMP variables:
  INTEGER :: TID=0 
  INTEGER :: NTHREADS=1
  
  CALL MPI_INIT(ierror)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, numprocs, ierror)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
  
  
  !$OMP PARALLEL PRIVATE(TID,NTHREADS)
  ! Obtain thread number
  TID = OMP_GET_THREAD_NUM()

  ! Obtain total number of threads
  NTHREADS = OMP_GET_NUM_THREADS()

  PRINT *, 'Hello World from thread=', TID, 'out of', NTHREADS, 'from processes', rank
  !$OMP END PARALLEL
  
  CALL MPI_FINALIZE(ierror)

END PROGRAM HYBRID_HELLO
