#!/bin/bash --login
# Request 24 cores [--ntasks=4 and --cpus-per-task=6
# Note that --ntasks is specified, not --nodes.

#SBATCH --job-name=ge-hostname
#SBATCH --partition=zythos
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=6
#SBATCH --gres=gpu:1
#SBATCH --time=00:10:00
#SBATCH --account=interns2016
#SBATCH --export=NONE

# load the necessary modules for gnu ,gcc because it is c code

module load gcc
module load mpt

# leave in, it list the environment loaded by the modules

module list


#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

EXECUTABLE=helloworld.gnu
SCRATCH=$MYSCRATCH/run_ge-hostname/$SLURM_JOBID
RESULTS=$MYGROUP/zythosC.gnu_results/$SLURM_JOBID

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

OUTPUT=helloworld.gnu.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

mpirun -np 24 helloworld.gnu./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  

mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`



