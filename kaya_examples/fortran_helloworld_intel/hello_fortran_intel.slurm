#!/bin/bash --login
#SBATCH --job-name=GE-fortran_helloworld_intel
#SBATCH --partition=work
#SBATCH --nodes=1
# -N is equivalent to --nodes
# -n is equivalent to --ntasks
# -c is "number of cores"
#SBATCH --mem=2G
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# To load the Intel environment
module use /uwahpc/centos8/modulefiles/oneapi-2023.0
module load compiler

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
EXECUTABLE=hello_fortran_intel
SCRATCH=$MYSCRATCH/run_fortran_helloworld_intel/$SLURM_JOBID
RESULTS=$MYGROUP/hellofortran_intel_results/$SLURM_JOBID

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
OUTPUT=fortran_helloworld_intel.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $EXECUTABLE $SCRATCH

cd $SCRATCH

srun -n 1 ./$EXECUTABLE >> ${OUTPUT}

if [ $? -ne 0 ]; then
    cd
    OUTPUT2=kaya_results.log
    echo "$EXECUTABLE with jobID $SLURM_JOBID Failed" >> ${OUTPUT2}
else
    cd
    OUTPUT2=kaya_results.log
    echo "$EXECUTABLE with jobID $SLURM_JOBID Succeeded" >> ${OUTPUT2}
fi

cd $SCRATCH

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo fortran_helloworld_intel job on kaya finished at  `date`

