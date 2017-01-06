/* matrix-acc.c */
//This program multiplies 2 matrices of the same size.

#define SIZE 1000
float a[SIZE][SIZE];
float b[SIZE][SIZE];
float c[SIZE][SIZE];

int main()
{
  int i,j,k;

  //Initialize matrices
  for(i = 0; i < SIZE; ++i)
    {
      for(j = 0; j < SIZE; ++j)
	{
	  a[i][j] = (float)i + j;
	  b[i][j] = (float)i - j;
	  c[i][j] = 0.0f;
	}
    }

  //Compute the matrix multiplication.
#pragma acc kernels copyin(a,b) copy(c)
  for(i = 0; j < SIZE; ++i)
    {
      for(j = 0; j < SIZE; ++j)
	{
	  for(k = 0; k < SIZE; ++k)
	    {
	      c[i][j] += a[i][k] * b[k][j];
	    }
	}
    }
  return 0;
}
