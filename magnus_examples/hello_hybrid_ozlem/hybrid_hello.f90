
PROGRAM HYBRID_HELLO
  IMPLICIT NONE
  INCLUDE 'mpif.h'
  
  ! OpenMPI variables:
  INTEGER :: rank
  INTEGER :: size
  INTEGER :: ierror, tag, status(MPI_STATUS_SIZE)

  ! OpenMP variables:
  INTEGER :: NTHREADS, TID, OMP_GET_NUM_THREADS
  
  ! Local variables:
  INTEGER :: i

  CALL MPI_INIT(ierror)
  CALL MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
  CALL MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)

  DO i=0, size-1
     IF (rank == i) THEN
        !PRINT *, 'node', rank, ': Hello world'

        ! Obtain thread number
        TID = OMP_GET_THREAD_NUM()
        PRINT *, 'Hello World from thread=', TID

        ! Only master thread does this
        IF (TID .EQ. 0) THEN
           NTHREADS = OMP_GET_NUM_THREADS()
           PRINT *, 'Number of threads = ', NTHREADS
        END IF
     END IF
  END DO
  
  CALL MPI_FINALIZE(ierror)

END PROGRAM HYBRID_HELLO
