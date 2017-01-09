#!/bin/bash -l

# SLURM directives
# for source code hello_mpi.f90
# Here we specify to SLURM we want one node (--nodes=1)
# a wall-clock time limit of 1 hours (--time=01:00:00)
#
# Replace hello_mpi.f90 with the appropriate job name
# following --account (e.g., --account=project123)

#SBATCH --job-name=getexample_mpi
#SBATCH --partition=debugq
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# To launch the job, we specify to aprun 48 MPI tasks (-n 48)
# required (-n 48) with 48 MPI tasks on the node (-N 48)
# These tasks are accommodated using the hyper-threading with
# two (hyper-) threads per core (-j 2).

# leave in, it list the environment loaded by the modules

module list

# Define variables local to this script
# Note: SLURM_JOBID is a unique number for every job.

JOBID=$SLURM_JOBID

# Define directory paths

SCRATCH=$MYSCRATCH/run_hello_mpi/${JOBID}
RESULTS=$MYGROUP/hello_mpi_results/${JOBID}

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

OUTPUT=hello_mpi.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cd $SCRATCH
 

echo "aprun -n 48 -N 48 -j 2 ./hello_mpi"   >> ${OUTPUT}
aprun -n 48 -N 48 -j 2 ./hello_mpi  >> ${OUTPUT}


#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`

