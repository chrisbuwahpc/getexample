#!/bin/bash --login
#SBATCH --job-name=GE-hostname
#SBATCH --partition=zythos
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=6
#SBATCH --account=pawsey0001
#SBATCH --time=00:10:00

# load the necessary modules

module load gcc
module load mpt

# leave in, it lists the environment loaded by the modules

module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

EXECUTABLE=hello_mpi_gnu
SCRATCH=$MYSCRATCH/run_hostname/$SLURM_JOBID
RESULTS=$MYGROUP/zythosmpi_gnu_results/$SLURM_JOBID

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

OUTPUT=hello_mpi_gnu.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

mpirun -np 24 ./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`



