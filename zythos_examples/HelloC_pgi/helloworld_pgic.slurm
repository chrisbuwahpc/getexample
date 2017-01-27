#!/bin/bash --login
# Request 24 cores [--ntasks=4 and --cpus-per-task=6
# Note that --ntasks is specified, not --nodes.

#SBATCH --job-name=GE-hostname
#SBATCH --partition=zythos
#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --account=pawsey0001
#SBATCH --export=NONE

# load the necessary modules

module load pgi

# load other necessary modules
module load mpt

# leave in, it list the environment loaded by the modules

module list


#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

EXECUTABLE=helloworld_pgi
SCRATCH=$MYSCRATCH/run_ge-hostname/$SLURM_JOBID
RESULTS=$MYGROUP/zythosC.pgi_results/$SLURM_JOBID

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

OUTPUT=helloworld_pgi.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

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



