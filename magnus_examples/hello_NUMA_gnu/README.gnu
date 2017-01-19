#!/bin/bash --login
# This is the README file is an executable script.
# To run type: ./README.gnu
# 
# Example OBjECTIVE: to demostrate omp_hello.c example on Magnus
# with GNU Environment where threads are restricted 
# to a single NUMA region of 12 cores. 
# omp_hello.c is taken from 
# https://computing.llnl.gov/tutorials/openMP/exercise.html
# To run this code,we need to specify the number of tasks
# and the number of threads.
# We also need to swap from Cray Environment to GNU 
# to compile the code on GNU Environment.
# This information is located under hello_numa_gnu.slurm
# You can edit the SLURM as: emacs hello_numa_gnu.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 1 node (--nodes=1)
# To compile this code with GNU, we need to change
# the environment from Cray to GNU as shown below:
# module swap PrgEnv-cray PrgEnv-intel
# Then, we set the total number of threads to 12
# export OMP_NUM_THREADS=12
# To launch a job, we specify to aprun 1 task (-n 1)
# with 12 threads (-d 12)
# placed expilicitly on cores 0-11 (-cc 0-11)
# Therefore, the aprun command looks like: 
# aprun -n 1 -d 12 -cc 0-11 ./$EXECUTABLE >> ${OUTPUT}

# To compile the omp_hello.c code on GNU Environment
cc -O2 -fopenmp omp_hello.c -o hello_numa_gnu

# To submit the job to Magnus
sbatch hello_numa_gnu.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_numa_results/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hello_numa_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_numa_gnu.log"
