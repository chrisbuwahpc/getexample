#!/bin/bash --login
#SBATCH --job-name=GE-lsdyan
#SBATCH --partition=pophealth
#SBATCH --nodes=1
#SBATCH --time=06:00:00   
#SBATCH --export=NONE

# To compile with the GNU environment, swap from Cray to GNU
module load ansys

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

SOURCE=foam/foam.k
SCRATCH=/scratch/$HOME/run_lsdyna_ystatic/$SLURM_JOBID
RESULTS=$HOME/lsdyna_ystatic_results/$SLURM_JOBID

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
OUTPUT=dyna_foam.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $SOURCE $SCRATCH

cd $SCRATCH
unzip $SOURCE 
ls -al

INPUT=foam.k

lsdyna i=$INPUT ncpu=4 memory=1000000000  > ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo helloC_gnu job finished at  `date`


