#!/bin/bash
#To compile the code ftn -O2 hello_mpi.f90 -O hello_mpi 
#Sbatch hello_world_mpi.slurm
#squeue -u $USER

echo "Your job is deleted from scratch"
echo "To get your job go to $MYGROUP/tb"
echo "Use JOBID to get your job in $MYGROUP"
echo "To see JOBID type :ls"
echo "Use your JOBID to see the output files"
echo "Type :cd JOBID to see the files"
echo "To see the output results type: cat hostname log"
echo "Results"
