#!/bin/bash --login
#SBATCH --job-name=GE-fortran_helloOpenMP_gnu
#SBATCH --partition=workq
#SBATCH --account=interns2016
#SBATCH --nodes=1
#SBATCH --time=00:10:00

# to compile the code in GNU module compiler
module load gcc

# load the other necessary module
module load mpt

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
EXECUTABLE=hello_omp_gnu
SCRATCH=$MYSCRATCH/run_fortran_helloOpenMP_gnu/$SLURM_JOBID
RESULTS=$MYGROUP/fortran_helloOpenMP_gnu_results_zeus/$SLURM_JOBID

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
OUTPUT=fortran_helloOpenMP_gnu.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

export OMP_NUM_THREADS=16

omplace -nt $OMP_NUM_THREADS -tm open64 ./$EXECUTABLE >> ${OUTPUT}

# Note that this job can be also run as:
# srun -n 1 -c $OMP_NUM_THREADS ./$EXECUTABLE >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo fortran_helloOpenMP_gnu job finished at  `date`



