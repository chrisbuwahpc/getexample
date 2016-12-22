#!/bin/bash -l
#SBATCH --job-name=hybrid_hello.f90
#SBATCH --partition=workq
#SBATCH --nodes=2
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# leave in, it list the environment loaded by the modules
module list

# Define variables local to this script
#  Note: SLURM_JOBID is a unique number for every job.
JOBID=$SLURM_JOBID
# Define directory paths
SCRATCH=$MYSCRATCH/run_hybrid_hello.f90/${JOBID}
RESULTS=$MYGROUP/hybrid_hello.f90_results/${JOBID}

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

