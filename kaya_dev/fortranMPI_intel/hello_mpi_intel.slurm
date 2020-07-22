#!/bin/bash -l
#SBATCH --job-name=GE-fortranMPI_intel
#SBATCH --partition=workq
#SBATCH --nodes=2
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# To swap from Cray Environment to Intel
module swap PrgEnv-cray PrgEnv-intel

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
EXECUTABLE=hello_mpi_intel
SCRATCH=$MYSCRATCH/run_fortranMPI_intel/$SLURM_JOBID
RESULTS=$MYGROUP/mpifortran_intel_results/$SLURM_JOBID

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
OUTPUT=fortranMPI_intel.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

aprun -n 48 -N 24 ./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo fortranMPI_intel job finished at  `date`


# To swap from Intel environment to the default program environment:
module swap PrgEnv-intel PrgEnv-cray
