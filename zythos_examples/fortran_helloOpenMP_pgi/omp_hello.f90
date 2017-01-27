      PROGRAM HELLO
     
      INTEGER NTHREADS, TID, OMP_GET_NUM_THREADS,&
      &       OMP_GET_THREAD_NUM
  
!$OMP PARALLEL PRIVATE(NTHREADS, TID)


      TID = OMP_GET_THREAD_NUM()
      PRINT *, 'Hello World from thread = ', TID

      IF (TID .EQ. 0) THEN
        NTHREADS = OMP_GET_NUM_THREADS()
        PRINT *, 'Number of threads = ', NTHREADS
      END IF

!$OMP END PARALLEL

      END

