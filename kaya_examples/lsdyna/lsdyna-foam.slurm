#!/bin/bash --login
#SBATCH --job-name=GE-lsdyna
#SBATCH --partition=work
#SBATCH --nodes=1
# -N is equivalent to --nodes
# -n is equivalent to --ntasks
# -c is "number of cores"
#SBATCH --ntasks=12
#SBATCH --mem-per-cpu=3G
#SBATCH --time=06:00:00   
#SBATCH --export=NONE

# To compile with the ansys - lsdyna environment
module load ansys/v195

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

INPUT=foam.k
SCRATCH=${MYSCRATCH}/run_lsdyna_foam/$SLURM_JOBID
RESULTS=${MYGROUP}/lsdyna_foam_results/$SLURM_JOBID

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

cp $INPUT $SCRATCH

cd $SCRATCH

# run the lsdyna simulation 
lsdyna i=$INPUT ncpu=${SLURM_NPROCS}   > ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo LSDYNA example job finished at `date`


