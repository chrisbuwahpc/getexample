#!/bin/bash --login
# This is the README file is an executable script.
# To run type: ./README.gnu
#
# Example OBjECTIVE: to demostrate hello_mpi.f90 example
# on Zeus. 
# This code is an MPI example that requests 2 nodes with 16
# MPI tasks running on each node.
# This example is taken from:
# https://people.sc.fsu.edu/~jburkardt/f_src/hello_mpi/hello_mpi.html
# To run this code, we need to edit the partition, 
# load the necessary modules
# and specify the total number of MPI tasks.
# This information is located under hello_world_mpi_gnu.slurm
# You can edit the SLURM as: emacs hello_world_mpi_gnu.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 2 nodes (--nodes=2)
# Then, we modify the partition to --partition==workq
# To run this code correctly on Zeus, we need to remove --export=NONE
# If it is still included in the SLURM, the code does not compile.
# To compile the code with GNU compiler, 
# we need to load the gcc module as shown below:
# module load gcc
# We then load the necessary modules before module listing.
# module load mpt
# We also specify to srun that 32 MPI tasks are required. (-n 32)
# with 2 nodes (-N 2) given that 
# there are 16 MPI tasks per node.
# For the correct operation, MPI also needs to be specified to srun
# via the option "--mpi=pmi2"
# Therefore, the srun command looks like:
# srun --mpi=pmi2 -n 32 -N 2 ./$EXECUTABLE >> ${OUTPUT}
 
# To compile the hello_mpi.f90 code

mpif90 -fopenmp -O2 hello_mpi.f90 -o hello_mpi_gnu

# To submit the job to Zeus
sbatch hello_mpi_gnu.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_mpi_gnu_results_zeus/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hello_mpi_gnu_results_zeus/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_mpi_gnu.log"

