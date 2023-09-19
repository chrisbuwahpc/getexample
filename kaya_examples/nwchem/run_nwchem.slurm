#!/bin/bash -l
#SBATCH --job-name=GE-nwchem
#SBATCH --partition=work
#SBATCH --nodes=1
#SBATCH --ntasks=2
# -N is equivalent to --nodes
# -n is equivalent to --ntasks
#SBATCH --mem-per-cpu=4GB
# the default is 1G per cpu(core)
# HINT!
# --mem=0 is a special case and grants the job access to all the memory on each node!
#SBATCH --time=00:05:00
#SBATCH --export=NONE

# to load the INTEL OneAPI modules and nwchem
module use /uwahpc/centos8/modulefiles/oneapi-2023.0
module load compiler/2023.0.0 mpi/2021.8.0

module load nwchem/7.2.0

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
INPUT=n2
SCRATCH=$MYSCRATCH/run_nwchem/$SLURM_JOBID
RESULTS=$MYGROUP/nwchem_results

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
OUTPUT=nwchem-$INPUT.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $INPUT.nw $SCRATCH

cd $SCRATCH
#NOTE .nw is 
mpirun -np $SLURM_NPROCS nwchem $INPUT >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $SCRATCH ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo run_nwchem job finished at  `date`
