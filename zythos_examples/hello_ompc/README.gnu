#!/bin/bash
# This is the README file that is an executable script to demonstrate
# omp_hello.c example on zythos
# The code is run in the gnu environment
# To run this code, specify the total number of processes per node
# and the number of processes per node.
# This information is located under hello_ompc_gnu.slurm
# You can edit the SLURM as: emacs hello_ompc_gnu.slurm

# SLURM directives
# 
# Here we specify to SLURM we want 2 tasks (--ntasks=2)
# Replace the account name with your account name (--account=interns2016)

# To compile the omp_hello.c code

gcc -O2 -openmp omp_hello.c -o hello_hello.gnu

# To submit the job to zythos

sbatch hello_ompc_gnu.slurm

# To view when the job starts

squeue -u $USER

echo "Your jobID is returned with the sbatch command."
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in /${MYGROUP}/hello_omp.gnu_results/"
echo "To change to your jobID directory, type:"
echo "cd /${MYGROUP}/hello_omp.gnu_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_omp.gnu.log"
