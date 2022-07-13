#!/bin/bash --login
#SBATCH --job-name=GE-structure
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --task=1
#SBATCH --mem-per-cpu=10G
#SBATCH --time=00:05:00   
#SBATCH --export=NONE

# Load the GNU and structure environment modules
module load gcc structure

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
DATA=
PARAM=
EXEC=structure

#SCRATCH=/tmp/$USER/run_structure/$SLURM_JOBID
SCRATCH=$MYSCRATCH/run_structure/$SLURM_JOBID
RESULTS=$MYGROUP/structure_results

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
OUTPUT=struct.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $DATA $SCRATCH

cd $SCRATCH

$EXEC $DATA > ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  ${SCRATCH} ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo structure job finished at  `date`
