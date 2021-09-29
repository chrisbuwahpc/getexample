#!/bin/bash -l
#SBATCH --job-name=lammps
#SBATCH --partition=admin
#SBATCH --nodes=1
#SBATCH --ntasks=36
#SBATCH --gres=gpu:1
#SBATCH --mem-per-cpu=10G
#SBATCH --time=00:20:00
#SBATCH --export=NONE

# load the compiler GNU and load lammps
module load gcc/9.4.0 lammps/29Oct20

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
EXECUTABLE=lmp
SCRATCH=$MYSCRATCH/run_lammps/$SLURM_JOBID
RESULTS=$MYGROUP/lmp_results/$SLURM_JOBID
export OMP_NUM_THREADS=36
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
OUTPUT=lammps.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH


cp *.lmp $SCRATCH

cd $SCRATCH

#srun --ntasks=36 --nodes=1 --gpus=1 
lmp -sf gpu -pk gpu 1 -in epm2.lmp >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo lammps_mpi job finished at  `date`
