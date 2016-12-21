#!/bin/bash --login

# SLURM directives
#
# Here we specify to SLURM we want one node (--nodes=1)
# a wall-clock time limit of one minute (--time=00:01:00)
#
# Replace hello_numa.slurm with appropriate project name
# following --account (e.g., --account=project123)

#SBATCH --job-name=hello_numa.slurm
#SBATCH --partition=workq
#SBATCH --nodes=1
#SBATCH --time=00:01:00
#SBATCH --export=NONE

# We specify to aprun that there is one task (-n 1) and we have
# 12 threads (-d 12) placed explicitly on cores 0-11 (-cc 0-11).
#
# We must also set OMP_NUM_THREADS=12
 
# leave in, it list the environment loaded by the modules
module list

# Define variables local to this script
#  Note: SLURM_JOBID is a unique number for every job.
JOBID=$SLURM_JOBID
# Define directory paths
SCRATCH=$MYSCRATCH/run_hostname/${JOBID}
RESULTS=$MYGROUP/hostname_results/${JOBID}

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
OUTPUT=hostname.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cd $SCRATCH
 
echo "/bin/hostname"  
/bin/hostname  

echo "/bin/hostname" > ${OUTPUT}   
/bin/hostname  >> ${OUTPUT}

echo "aprun -n -N 8 /bin/hostname"  
aprun -n 16 -N 8 /bin/hostname

echo "aprun -n -N 8 /bin/hostname"   >> ${OUTPUT}
aprun -n 16 -N 8 /bin/hostname  >> ${OUTPUT}


#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`

export OMP_NUM_THREADS=12
aprun -n 1 -d 12 -cc 0-11 ./hello_numa.slurm
