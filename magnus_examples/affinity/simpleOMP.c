//gcc -fopenmp -std=c99 pragma_test.c to compile with forloop 

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/times.h>
#include <unistd.h>

int main()
{
	FILE* fp;
	fp = fopen("still_running", "a");
	fclose(fp);
	int file_exists=1;

	static clock_t start_time;
	static clock_t end_time;
	static clock_t nested_start_time;
	static struct tms start_cpu;
	static struct tms end_cpu;

	unsigned total_time, nested_time, loop_count = 1;

	float result = rand() % 100 + 1;
	int loops=40;
	start_time = times(&start_cpu);

	while(file_exists == 1)
	{
		printf("TEST STARTING (PASS %d)\n", loop_count);
		printf("************************\n");		
		#pragma omp parallel firstprivate(end_time, nested_start_time, result )	
		{
			int rand_num;
			int id = omp_get_thread_num();
			#pragma omp barrier		

			#pragma omp for
			for(int i = 0; i < loops; i++)
			{	
				nested_start_time = times(&start_cpu);

				while((end_time - nested_start_time) < 3000)
				{
					end_time = times(&end_cpu);
					rand_num = rand();	

					if ((rand_num % 2) == 0)
						result = result + 0.00001;

					else
						result = result - 0.00001;	
					//printf("i=%d j=%d\n", i, rand_num%X);
				}
				total_time =(double)(end_time - start_time);           //real time in milliseconds
			}		

			printf("THREAD NUMBER:          %d\n", id);
			printf("OVERALL TIME:           %d ms\n", total_time);
			printf("CALCULATED VALUE:       %f\n\n", result);

			result = rand() % 100 + 1;		

		}

		if ((access("still_running", F_OK)) == 0)
			file_exists = 1;

		else
			file_exists = 0;	

		loop_count += 1;
	}

	printf("***still_running has been removed***\n\n");	
	return 0;
}



