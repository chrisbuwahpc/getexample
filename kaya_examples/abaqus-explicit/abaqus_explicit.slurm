#!/bin/bash --login
#SBATCH --job-name=GE-abaqus-explicit
#SBATCH --partition=day
#SBATCH --nodes=1
# -N is equivalent to --nodes
# -n is equivalent to --ntasks
#SBTACH --ntasks=36
#SBATCH --ntasks-per-node=36
#SBATCH --mem-per-cpu=10g
#SBATCH --time=00:30:00   
#SBATCH --export=NONE

# To compile with the GNU environment, swap from Cray to GNU
module load abaqus/2020 intel/2020.4
# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
cd ${SLURM_SUBMIT_DIR}
INPUT=e4

SCRATCH=$MYSCRATCH/run_abaqus/$SLURM_JOBID
#SCRATCH=/tmp/$USER/run_abaqus/${SLURM_JOBID}
RESULTS=$MYGROUP/abaqus_results

### need to unset this
unset SLURM_GTIDS

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
OUTPUT=abaqus_stdout.log

### Create ABAQUS environment file for current job, you can set/add your own options (Python syntax)
env_file=abaqus_v6.env

cat << EOF > ${env_file}
verbose = 1
EOF

node_list=$(scontrol show hostname ${SLURM_NODELIST} | sort -u)

mp_host_list="["
for host in ${node_list}; do
    mp_host_list="${mp_host_list}['$host', ${SLURM_CPUS_ON_NODE}],"
done

mp_host_list=$(echo ${mp_host_list} | sed -e "s/,$/]/")

echo "mp_host_list=${mp_host_list}"  >> ${env_file}

export OMP_NUM_THREADS=1


#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH
cd ${SLURM_SUBMIT_DIR} 
echo "current directory is "`pwd`

cp ${INPUT}.inp $SCRATCH/.
cd $SCRATCH 


abaqus interactive job=${INPUT} cpus=${SLURM_NTASKS} \
	scratch=.  mp_mode=threads 

#abaqus datacheck job=${INPUT} scratch=. interactive
#abaqus job=support information=support

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
cp -r ${SCRATCH} ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo abaqus job finished at  `date`





