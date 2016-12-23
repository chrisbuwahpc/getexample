PROGRAM HELLO

use omp_lib
INTEGER NTHREADS, TID

! Fork a team of threads giving them their own copies of variables
!$OMP PARALLEL PRIVATE(NTHREADS_NUM)

! Obtain thread number
  TID=OMP_GET_THREAD_NUM()
  PRINT*,'Hello World from thread=',TID

! Only master thread does this

  IF (TID .EQ. O) THEN
   NTHREADS = OMP_GET_NUM_THREADS ()
  PRINT*,'Number of threads=',NTHREADS
  END IF

! All threads join master thread and disband
!$OMP END PARALLEL

 END
