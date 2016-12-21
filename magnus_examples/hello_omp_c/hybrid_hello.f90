PROGRAM HYBRID
IMPLICIT NONE
include 'mpif.h'

! openMPI variables
  integer :: rank
  integer :: size
  integer :: error
  integer :: tag
  integer :: status(MPI_STATUS_SIZE)

! openMP  variables
        INTEGER :: NTHREADS, TID, OMP_GET_NUM_THREADS

! local variables
  integer :: i

call MPI_INIT(ierror)
call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)

DO i=0, size-1
  IF ( rank==i) THEN
    print*, 'node',rank,':Hello world'
  END IF
END DO
call MPI_FINALIZE(ierror)
end PROGRAM HYBRID
