#!/bin/bash --login

# SLURM directives
#
# Here we specify to SLURM we want two nodes (--nodes=2) with
# a wall-clock time limit of twenty minutes (--time=00:20:00).
#
# Replace hybrid_hello.f90 with the approriate project name
# following --account (e.g., --account=project123).

#SBATCH --job-name=hybrid_hello.f90
#SBATCH --partition=workq
#SBATCH --nodes=2
#SBATCH --time=00:20:00
#SBATCH --export=NONE

# To launch the job, we specify to aprun 8 MPI tasks (-n 8)
# with 4 MPI tasks per node (-N 4), with two MPI tasks per
# socket or NUMA region ( -S 2) . Each MPI task will have 6
# threads (-d 6)
#
# We must also set OMP_NUM_THREADS=6

# leave in, it list the environment loaded by the modules

module list

# Define variables local to this script
# Note: SLURM_JOBID is a unique number for every job.

JOBID=$SLURM_JOBID

# Define directory paths

SCRATCH=$MYSCRATCH/run_hybrid_hello_f90/${JOBID}
RESULTS=$MYGROUP/hybrid_hello_f90_results/${JOBID}

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

echo "export OMP_NUM_THREADS=6"  
export OMP_NUM_THREADS=6

echo "aprun -n -N 4 /bin/hostname"   >> ${OUTPUT}
aprun -n 8 -N 4 -S 2 -d 6 /.hybrid_hello.f90  >> ${OUTPUT}


#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move
  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo hostname job finished at  `date`

