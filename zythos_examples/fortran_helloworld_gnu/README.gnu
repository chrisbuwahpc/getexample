#!/bin/bash --login
# This is the README file is an executable script.
# To run type: ./README.gnu
#  
# Example OBJECTIVE: to demonstrate hello_world.f90 example 
# with GNU compiler on Zythos.
# hello_world.f90 is a simple FORTRAN code prints "Hello World!" 
# and runs on a single node.
# To run this code, we need to specify the number of nodes used.
# This information is located under hello_fortran_gnu.slurm
# You can edit the SLURM as: emacs hello_fortran_gnu.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 1 node (--ntasks=1)
# We then change the partition to zythos (--partition=zythos)
# To run this code correctly, we need to remove --export=NONE
# from the SLURM. If not removed, the code does not compile.
# To compile this code with GNU, we load the gcc module compiler as shown below.
# module load gcc
# To run the code, we simply type:
# ./$EXECUTABLE >> ${OUTPUT}

# To compile the hello_world.f90 code with GNU
gfortran -O2 hello_world.f90 -o hello_fortran_gnu

# To submit the job to Zythos
sbatch hello_fortran_gnu.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_results_fortran_zythos/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hello_results_fortran_zythos/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_fortran_gnu.log"
