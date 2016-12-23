#!/bin/bash -l

# SLURM directives
#
# Here we specify to SLURM we want one node (--nodes=1)
# a wall-clock time limit of 1 hours (--time=01:00:00)
#
# Replace omp_hello.f90 with the appropriate job name
# following --account (e.g., --account=project123)

#SBATCH --job-name=getexample_omp
#SBATCH --partition=debugq
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# To launch the job, we specify to aprun 24 MPI tasks (-n 24)
# required (-n 24) with 24 MPI tasks on the node (-N 24)
# task is asscociated with 2 threads (-d 2) and these are two 
# These tasks are accommodated using the hyper-threading with
# (hyper-) threads per core (-j 2).

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
 
echo "OMP_NUM_THREADS=2"
OMP_NUM_THREADS=2

echo "aprun -n 24 -N 24 -d 2 -j 2 ./omp_hello"   >> ${OUTPUT}
aprun -n 24 -N 24 -d 2 -j 2 ./omp_hello  >> ${OUTPUT}


#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`

