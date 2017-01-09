#!/bin/bash --login
# This is the README.gnu file is an executable script.
# To run type: ./README.gnu
#
# Example OBJECTIVE: to demonstrate hello_mpi.f90 example
# on Magnus with GNU compiler.
# To run this code, we need to specify the total number of MPI tasks
# and the number of MPI tasks per node.
# This information is located under hello_world_mpi.slurm
# You can edit the SLURM as: emacs hello_world_mpi.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 2 nodes (--nodes=2)
# To launch a job, we specify to aprun 48 MPI tasks (-n 48)
# with 24 tasks per node (-N 24)
# Therefore, the aprun command looks like: 
# aprun -n 48 -N 24 ./$EXECUTABLE  >> ${OUTPUT}

# To compile the hello_mpi.f90 code with GNU
ftn -O2 hello_mpi.f90 -o hello_mpi

# To submit the job to Magnus
sbatch hello_world_mpi.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_results/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hello_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello.log"
