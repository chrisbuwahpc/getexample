#!/bin/bash --login
#SBATCH --job-name=GE-kay
#SBATCH --partition=day
#SBATCH --nodes=1
#SBATCH --time=00:05:00   
#SBATCH --mem=128G
#SBATCH --export=NONE

# To compile with the GNU environment, swap from Cray to GNU
module load gcc/9.4.0 kat/2.4.1

# leave in, it lists the environment loaded by the modules
module list

#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
DATA=ecoli_r1.1K.fastq
DATA1=ecoli_r2.1K.fastq
DATA2=EcoliK12.fasta
DATADIR=kat_data

#SCRATCH=/tmp/$USER/run_kat/$SLURM_JOBID
SCRATCH=$MYSCRATCH/run_kat/$SLURM_JOBID
RESULTS=$MYGROUP/kat_results

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
OUTPUT=kat-run.log

#############################################
#   Copy input files to $SCRATCH this puts all the files in the working
#   Directory,  may not always need todo.
#   then change directory to $SCRATCH

cp $DATADIR/$DATA $SCRATCH
cp $DATADIR/$DATA1 $SCRATCH
cp $DATADIR/$DATA2 $SCRATCH

cd $SCRATCH

# ideally you want something like this where datadir and data file names
# are variables that are set only once.
# kat comp -m13 -o spectra-cn_test ${DATADIR}/${DATA} ${DATADIR}/${DATA2}

kat comp -m13 -o spectra-cn_test ecoli_r1.1K.fastq EcoliK12.fasta > ${OUTPUT}
kat comp -m13 -v -n -o density_test ecoli_r1.1K.fastq ecoli_r2.1K.fastq >> ${OUTPUT}
kat comp -m13 -o glob_test '/ecoli_r?.1K.fastq' EcoliK12.fasta ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv  $OUTPUT ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

rm -r $SCRATCH

echo kat job finished at  `date`


