#!/bin/bash --login

# SLURM directives
#
# Here we specify to SLURM we want 2 nodes (--nodes=2)
# a wall-clock time limit of 10 minutes (--time=00:10:00)
#
# Replace hello_mpi.f90 with appropriate project name
# following --account (e.g., --account=project123)

#SBATCH --account=omp_hello.c
#SBATCH --partition=workq
#SBATCH --nodes=2
#SBATCH --time=00:10:00
#SBATCH --export=NONE

# To launch the job, we specify to aprun 24 MPI tasks (-n 24)
# with 12 MPI tasks per node (-N 12), and also specify 6 MPI
# tasks per socket (-S 6)
#
# Note we avoid any inadvertent OpenMP threading by setting
# OMP_NUM_THREADS=1
 
# leave in, it list the environment loaded by the modules

module list

# Define variables local to this script
#  Note: SLURM_JOBID is a unique number for every job.

JOBID=$SLURM_JOBID

# Define directory paths

SCRATCH=$MYSCRATCH/run_omp_hello/${JOBID}
RESULTS=$MYGROUP/omp_hello_results/${JOBID}

###############################################
# Creates a unique directory in the SCRATCH directory for this job to run in.

if [ ! -d $SCRATCH ]; then 
    mkdir -p $SCRATCH 
fi 
echo SCRATCH is $SCRATCH

###############################################
# Creates a unique directory in your GROUP directory for the results of this job

if [ ! -d $RESULTS ]; then 
    mkdir -p $RESULTS 
fi
echo the results directory is $RESULTS

################################################
# declare the name of the output file or log file

OUTPUT=omp_hello.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cd $SCRATCH
 
echo "/bin/hostname"  
/bin/omp_hello

echo "/bin/hostname" > ${OUTPUT}   
/bin/omp_hello >> ${OUTPUT}

echo "aprun -n -N 8 /bin/hostname"  
aprun -n 16 -N 8 /bin/omp_hello

echo "aprun -n -N 8 /bin/hostname"   >> ${OUTPUT}
aprun -n 16 -N 8 /bin/omp_hello >> ${OUTPUT}


#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move
  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`

export OMP_NUM_THREADS=1
aprun -n 24 -N 12 -S 6 ./omp_hello
