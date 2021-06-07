#!/usr/bin/tcsh 
#SBATCH --job-name=GE-mrcc
#SBATCH --partition=short
## note -c to use just cores (no mpi)
#SBATCH -c 8
#
#SBATCH --time=01:00:00   
#SBATCH --export=NONE

# mrcc is compile with the intel compiler
module load mrcc/2020-02-22

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables

set INPUT = MINP_OH_cc-pVQZ_DF-UHF
set EXEC = dmrcc
set SCRATCH = /tmp/$USER/run_mrcc/$SLURM_JOBID
# mrcc scratch directory Amir's MRCC convention
setenv MRCC_SCRDIR $SCRATCH
set RESULTS = $MYGROUP/mrcc_results

setenv OMP_NUM_THREADS $SLURM_CPUS_PER_TASK
setenv MKL_NUM_THREADS $SLURM_CPUS_PER_TASK
echo "check $OMP_NUM_THREADS is the number threads"

###############################################
# Creates a unique directory in the SCRATCH directory for this job to run in.
if ( ! -d $SCRATCH ) then 
    mkdir -p $SCRATCH 
    mkdir -p $MRCC_SCRDIR
endif 
echo SCRATCH is $SCRATCH

###############################################
# Creates a unique directory in your GROUP directory for the results of this job
if ( ! -d $RESULTS ) then 
    mkdir -p $RESULTS 
endif 
echo the results directory is $RESULTS

################################################
# declare the name of the output file or log file
set OUTPUT = mrcc_${INPUT}.out

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH
cd ${SLURM_SUBMIT_DIR}
cp ${INPUT} $SCRATCH
cp ${MAALI_MRCC_HOME}/GENBAS $SCRATCH

cd $SCRATCH
ln -s ${SLURM_SUBMIT_DIR}/$OUTPUT $OUTPUT
# rename input to MINP
cp ${INPUT} MINP
ls -al

${EXEC} > ${OUTPUT}

#############################################
# $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  ${SCRATCH} ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 
if (-d $SCRATCH ) then
    rm -r $SCRATCH
endif 

echo mrcc job on kaya finished at  `date`


