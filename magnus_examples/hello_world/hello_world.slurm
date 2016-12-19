#!/bin/bash
#To compile the hello code ftn -O2 hello_mpif90 -0 hello_mpi
#Sbatch hello_world_mpi.slurm squeue -u $USER

echo " Your job is deleted from scratch and put to your group"
echo "To go to your group type cd $MYGROUP/tb "
echo "To see your JOBID type : ls"
echo "To see the output files, use JOBID and type : cd JOBID"
echo "To see the results ,type : cat hostname log"
