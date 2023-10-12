#!/bin/bash 
#SBATCH --job-name=GE-orca
#SBATCH --partition=work
## note -c to use just cores (no mpi)
#SBATCH --nodes=1
#SBATCH --ntasks=16
#SBATCH --ntasks-per-node=16
#
#SBATCH --time=00:10:00   
#SBATCH --mem-per-cpu=3G
#SBATCH --export=NONE

# 
module load orca/5.0.4-dyn

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

INPUT=water
#INPUT=fcfc-118-freq
#INPUT=BLYP-D3-def2-SVP
#INPUT=pagt-spe-ccsdt-rif12-qz
#INPUT=tight
EXEC=orca
SCRATCH=$MYSCRATCH/run_orca/$SLURM_JOBID

RESULTS=$MYGROUP/orca_results

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
OUTPUT=orca_${INPUT}.out

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH
cd ${SLURM_SUBMIT_DIR}
cp ${INPUT}.inp $SCRATCH

cd $SCRATCH
ls -al 
echo 'number of cpus or tasks is:'  ${SLURM_NTASKS}
#mpirun -np 16 ${MAALI_ORCA_HOME}/orca  ${INPUT}.inp > ${OUTPUT}
${MAALI_ORCA_HOME}/orca  ${INPUT}.inp > ${OUTPUT}
#############################################
# $OUTPUT file to the unique results dir
# note this can be a copy or move  
#mv  ${SCRATCH} ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 
#if [ -d $SCRATCH ]; then
#    rm -r $SCRATCH
#fi 

echo orca job on kaya finished at  `date`


