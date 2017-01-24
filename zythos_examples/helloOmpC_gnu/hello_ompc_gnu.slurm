#!/bin/bash --login
#SBATCH --job-name=ge-hostname
#SBATCH --partition=zythos
#SBATCH --reservation=courseq
#SBATCH --ntasks=2
#SBATCH --cpus-per-task=6
#SBATCH --time=00:10:00
#SBATCH --export=NONE

# Default loaded compiler module is gcc module which applies for gnu

module load gcc
module load mpt
 
#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

EXECUTABLE=omp_hello.gnu
SCRATCH=$MYSCRATCH/run_ge-hostname/$SLURM_JOBID
RESULTS=$MYGROUP/zythos_omp.gnu_results/$SLURM_JOBID

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

OUTPUT=hello_omp.gnu.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $HOME/$EXECUTABLE $SCRATCH

cd $SCRATCH

export OMP_NUM_THREADS=12
omplace -nt $OMP_NUM_THREADS ./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  

mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`



