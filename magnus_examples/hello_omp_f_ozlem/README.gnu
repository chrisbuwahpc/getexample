#!/bin/bash --login
# This is the README file that is an executable script.
# To run type: ./README.gnu
#
# Example OBJECTIVE: to demostrate omp_hello.f example on Magnus
# with GNU Environment where omp_hello.f
# is an OpenMP code and restricted to a single node.
# omp_hello.f is taken from
# https://computing.llnl.gov/tutorials/openMP/exercise.html
# To run this code, we need to specify the number of tasks
# and the number of threads.
# We also need to swap from Cray to GNU environment to
# compile the code with GNU.
# This information is located under hello_omp_gnu.slurm
# You can edit the SLURM as: emacs hello_omp_gnu.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 1 node (--nodes=1)
# To change the compiler environment from Cray to GNU,
# we simply add: module swap PrgEnv-gnu
# Then, we set the total number of threads to 24:
# export OMP_NUM_THREADS=24
# To launch a job, we specify to aprun 1 OpenMP task (-n 1)
# with 24 threads (-d 24)
# Therefore, the aprun command looks like: 
# aprun -n 1 -d 24 ./$EXECUTABLE >> ${OUTPUT}

# To compile the omp_hello.f code with GNU
ftn -O2 -fopenmp omp_hello.f -o hello_omp_gnu

# To submit the job to Magnus
sbatch hello_omp_gnu.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_omp_f_results/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hello_omp_f_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_omp_gnu.log"
