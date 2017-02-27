      program solvelin
*
*  This is a sample program to solve Ax=rhs using LAPACK 
*    A is a general double precision n by n matrix. 
*
      implicit none  
      integer lda 
      parameter(lda = 5000) 
      integer info, n, ldb, nrhs  
      integer indx(lda) 
      double precision a(lda,lda), rhs(lda)
    
      integer i, j 
*
*    Extraneous variables used to test code.
*      Would not usually be required in a real code
*      (as they increase required storage)  
* 
      double precision aold(lda,lda), rold(lda), res(lda) 
      double precision reserr 

      n = lda 
      ldb = lda 
      nrhs = 1 

*      print *,' input n'
*      read *, n  

*
*     Create a matrix and right hand side
*
      do j = 1, n 
         do i = 1, n
            a(i,j) = 1./(i + 2*j)
* 
* to see an error 
* try instead a(i,j) = 1./(i * 2*j)
* 
            aold(i,j) = a(i,j) 
         end do
         rhs (j) = 1.d0
         rold (j) = rhs(j) 
      end do 

      call dgesv( n, nrhs, a, lda, indx, rhs, ldb, info ) 
*
*   Parameters of dgesv 
* 
*   n  is the matrix size, n >= 1 . (input) 
* 
*   nhrs is the number of Right Sides to be solved
*          --here 1 (input)  
*
*    A is the matrix in Ax = b, overwritten on output by 
*         L and U -- where L*U = A (rows permuted) 
*         A is double precision n by n , but with leading
*         dimension lda >= n . 
*         A is input, but is different on output (in/out) . 
*
*    lda is the leading dimension of A.  lda >= n . 
*
*    idx , integer array dimension n, idx(i) 
*      was interchanged with the ith row of A.    (output) 
* 
*    rhs  , double precision array of dimension (ldb,nhrs)
*        On input it is the right hand side(s) b, on output
*        it is the solution vector(s) x.   (in/out) 
*
*    info integer, output info = 0 indicates a successful exit
*                 info <= -i, the ith argument was illegal. 
*                 info = i means u(i,i) was zero so factorization
*                    not completed. 
* 
      do i =1,n 
         res(i) = rold(i) 
      end do 
      do j=1,n
         do i=1,n 
            res(i) = res(i) - aold(i,j) * rhs(j)
         end do 
      end do 
      reserr = 0.d0
      do i =1,n
         reserr = reserr + abs(res(i))
      end do
      reserr = reserr/n 

      print *,' average absolute value of residual vector entry', reserr 
      print *,' info =', info 

      stop 
      end




       
       


