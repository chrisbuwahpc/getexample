#!/bin/bash --login

#SBATCH --partition=workq
#SBATCH --job-name=hostname
#SBATCH --nodes=2
#SBATCH --time=00:10:00
#SBATCH --account=interns2016

# to swap with pgi and load the necessary modules for intel
# Default loaded compiler module is gcc module

module load gcc 

# leave in, it list the environment loaded by the modules

module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

EXECUTABLE=helloworld_zeus_gnu
SCRATCH=$MYSCRATCH/run_helloworld_zeus_gnu/$SLURM_JOBID
RESULTS=$MYGROUP/helloworld_zeus_gnu_results/$SLURM_JOBID

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

OUTPUT=helloworld_zeus_gnu.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

export OMP_NUM_THREADS=16
./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  

mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`



