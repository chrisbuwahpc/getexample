#!/bin/bash --login
#SBATCH --job-name=GE-HelloC_gnu_zythos
#SBATCH --partition=zythos
#SBATCH --ntasks=1
#SBATCH --time=00:05:00
#SBATCH --account=pawsey0001

# Default loaded module compiler is gcc module.
# to compile with GNU compiler, load the gcc module in case.
module load gcc

# leave in, it list the environment loaded by the modules
module list


#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

EXECUTABLE=helloworld_gnu
SCRATCH=$MYSCRATCH/run_HelloC_gnu_zythos/$SLURM_JOBID
RESULTS=$MYGROUP/HelloC_gnu_zythos_results/$SLURM_JOBID

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

OUTPUT=HelloC_gnu_zythos.log

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

echo HelloC_gnu_zythos job finished at  `date`



