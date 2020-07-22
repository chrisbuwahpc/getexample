#!/bin/bash -l
#SBATCH --job-name=mom_node
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
SCRATCH=$MYSCRATCH/run_mom_node/${JOBID}
RESULTS=$MYGROUP/mom_node_results/${JOBID}

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
OUTPUT=mom_node.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cd $SCRATCH
 
echo "/bin/mom_node"  
/bin/mom_node  

echo "/bin/mom_node" > ${OUTPUT}   
/bin/mom_node  >> ${OUTPUT}

echo "aprun -n -N 8 /bin/mom_node"  
aprun -n 16 -N 8 /bin/mom_node

echo "aprun -n -N 8 /bin/mom_node"   >> ${OUTPUT}
aprun -n 16 -N 8 /bin/mom_node  >> ${OUTPUT}


#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo mom_node job finished at  `date`

