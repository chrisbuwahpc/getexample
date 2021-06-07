#!/bin/tcsh 
# This is a example of a Shared Memory Parallelism job using the
# OpenMP compiler directives on a single Kaya node.  
#
#SBATCH --job-name=GE-molpro
#SBATCH --partition=short
## SBATCH --mem-bind  need task/affinity binding
## is the slurm task/affinity plugin installed
## need to know how to test it.
#SBATCH --mem=10000M
## the real memory required per node [K|M|G|T]
## 10000M = 10G 
#SBATCH --ntasks=1
## an OpenMP job is a single task the
## the OpenMP threads is the number of cpus(or cores)_per_task
## SBATCH -c is the number of cores 
## # SLURM_CPUS_PER_TASK is set to the value of -c, but only if -c is explicitly set
#SBATCH -c 8 
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# 
module load molpro/2015.1

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
set INPUT = h2
set SCRATCH = /tmp/$USER/run_molpro/$SLURM_JOBID
setenv MOL_SCRDIR ${SCRATCH}
set RESULTS = $MYGROUP/molpro_results

setenv OMP_NUM_THREADS ${SLURM_CPUS_PER_TASK}
setenv MKL_NUM_THREADS ${SLURM_CPUS_PER_TASK}

echo "The number of threads/cores is  $OMP_NUM_THREADS "

###############################################
# Creates a unique directory in the SCRATCH directory for this job to run in.
if ( ! -d $SCRATCH ) then 
    mkdir -p $SCRATCH 
endif 
echo SCRATCH is $SCRATCH

###############################################
# Creates a unique directory in your GROUP directory for the results of this job
if ( ! -d $RESULTS ) then 
    mkdir -p $RESULTS 
endif
echo the results directory is $RESULTS

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp ${INPUT}.com $SCRATCH

cd $SCRATCH

molpro -n ${SLURM_CPUS_PER_TASK} -d $MOL_SCRDIR -o ${INPUT}.out ${INPUT}.com 

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  

mv  ${SCRATCH} ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 
if ( -d ${SCRATCH} ) then
   rm -r ${SCRATCH}
endif

echo Molpro job on kaya finished at  `date` 
