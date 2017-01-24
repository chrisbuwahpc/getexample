#!/bin/bash --login
# This is the README file is an executable script.
# To run type: ./README.hybrid.gnu
#
# Example OBjECTIVE: to demostrate hybrid_hello.f90 example
# on Zeus. 
# this code runs in the gnu module
# To run this code, we need to edit the partition, 
# load the necessary modules,
# specify the total number of MPI tasks and
# the number of OpenMP threads.
# This information is located under hello_hybrid_gnu.slurm
# You can edit the SLURM as: emacs hello_hybrid_gnu.slurm &

# SLURM directives
# 
# Here specify to SLURM that we want 2 nodes (--node=2)
# We the modify the partition to --partition==workq
# To  compile with gnu, we need to swap from intel to gnu
# Then, we load the necessary modules before module listing.
#
# This script requires 2 nodes and runs 1 MPI process with
# 16 OpenMP threads on each intel compiled executable.
# Hence, we set the number of threads to 16 as shown below: 
# export OMP_NUM_THREADS=16
# Therefore, the srun command looks like:
# srun --mpi=pmi2 -n 2 -N 2 ./$EXECUTABLE >> ${OUTPUT}
 
# To compile the hybrid_hello.f90 code with gnu compiler

mpif90 -O2 -fopenmp hybrid_hello.f90 -o hello_hybrid_gnu

# To submit the job to Zeus

sbatch hello_hybrid_gnu.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hellohybrid_gnu_results/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hellohybrid_gnu_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_hybrid_gnu.log"
