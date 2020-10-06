#!/bin/bash -l
#SBATCH --job-name=GE-grasp
#SBATCH --partition=test
#SBATCH --nodes=1
#SBATCH --ntasks=34
#SBATCH --time=02:00:00
#SBATCH --export=ALL

# To swap from Cray Environment to GNU
module load gcc/8.3.1 openmpi/4.0.0 lapack/3.9.0

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
EXECUTABLE=sh_case1
INFILE=script
SCRATCH=/tmp/$USER/run_grasp/$SLURM_JOBID
RESULTS=$HOME/grasp_results/$SLURM_JOBID
export GRASP=/group/ea001/cbording/grasp/grasp-2018-12-03
export PATH=${GRASP}/bin:$PATH
export LD_LIBRARY_PATH=${GRASP}/lib:${LD_LIBRARY_PATH}
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
echo path is $PATH
which rci 
# declare the name of the output file or log file
OUTPUT=case1_mpi.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp -R grasp/${INFILE} ${SCRATCH}

cd $SCRATCH/${INFILE}

./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo graspMPI job finished at  `date`


