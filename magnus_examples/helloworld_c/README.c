#!/bin/bash
# This is the README file that is an executable script to demonstrate
# helloworld.c example on Magnus.
# This runs in the cray environment
# It is a simple code that prints out "Hello World!, I'm a C++ program. That's it.Bye"

# The example is taken from https:http://www.cplusplus.com/doc/tutorial/program_structure/
# To run the code,you specify the total number of processes per node
# and the number of processes per node.
# This information is located under helloworld.c.slurm
# You can edit the SLURM as: emacs/nano helloworld.slurm

# SLURM directives
# 
# Here we specify to SLURM we want 1 node (--nodes=1)
# Replace the account name with your account name (--account=interns2016)

# To compile the helloworld.c code

CC -O2 helloworld.c -o helloworld_c 

# To submit the job to Magnus

sbatch helloworld.c.slurm

# To view when the job starts

squeue -u $USER

echo "Your jobID is returned with the sbatch command."
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in /${MYGROUP}/hello_omp_c_results/"
echo "To change to your jobID directory, type:"
echo "cd /${MYGROUP}/hello_omp_c_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_omp_c.log"
