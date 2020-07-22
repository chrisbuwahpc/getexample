#!/bin/bash -l
#SBATCH --job-name=gromacs_mpi
#SBATCH --partition=workq
#SBATCH --nodes=2
#SBATCH --time=00:40:00
#SBATCH --export=NONE

# to swap the compiler from Cray to GNU
module swap PrgEnv-cray PrgEnv-gnu
module load gromacs/5.1.1

# leave in, it lists the environment loaded by the modules
module list

echo submission dir $SLURM_SUBMIT_DIR
#  Note: SLURM_JOBID is a unique number for every job.
#  These are generic variables
EXECUTABLE=gmx 
SCRATCH=$MYSCRATCH/run_gromacs/$SLURM_JOBID
RESULTS=$MYGROUP/gromacs_results/$SLURM_JOBID
INPUT_DATA_DIR=${SLURM_SUBMIT_DIR}/gromacs_mpi
GROMACS_DATA_DIR=${SLURM_SUBMIT_DIR}
OUTFILE=1AKI_processed.gro
PDB_FILE=1AKI.pdb

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
OUTPUT=gromacs_mpi.log

#############################################
#   Copy input files to $SCRATCH
#   then change directory to $SCRATCH

cp $GROMACS_DATA_DIR/*.pdb $SCRATCH
cp $INPUT_DATA_DIR/posre.itp $SCRATCH
cp $INPUT_DATA_DIR/1AKI_processed.gro $SCRATCH
cp $INPUT_DATA_DIR/topol.top $SCRATCH
cp $INPUT_DATA_DIR/*.mdp $SCRATCH

echo gmxlib is $GMXLIB

cd $SCRATCH
### for mpi runs want something like this
# aprun -n 48 -N 24 $EXECUTABLE pdb2gmx -f 1AKI.pdb -o 1AKI_processed.gro -water spce  > ${OUTPUT}

aprun -n 1 -N 1 $EXECUTABLE pdb2gmx -f ${PDB_FILE} -o $OUTFILE -water spce << EOF
29
0
EOF
aprun -n 1 -N 1 gmx_d editconf -f 1AKI_processed.gro  -o 1AKI_newbox.gro -c -d 1.0 -bt cubic  > ${OUTPUT}
aprun -n 1 -N 1 gmx_d solvate -cp 1AKI_newbox.gro -cs spc216.gro -o 1AKI_solv.gro -p topol.top >> ${OUTPUT}
#Adding Ions
#wget http://www.bevanlab.biochem.vt.edu/Pages/Personal/justin/gmx-tutorials/lysozyme/Files/ions.mdp
aprun -n 1 -N 1 gmx_d grompp -f ions.mdp -c 1AKI_solv.gro -p topol.top -o ions.tpr >> ${OUTPUT}
aprun -n 1 -N 1 gmx_d genion -s ions.tpr -o 1AKI_solv_ions.gro -p topol.top  -pname NA -nname CL -nn 8 << EOF 
13
EOF

# Energy Minimization
##wget http://www.bevanlab.biochem.vt.edu/Pages/Personal/justin/gmx-tutorials/lysozyme/Files/minim.mdp

aprun -n 1 -N 1 gmx_d grompp -f minim.mdp -c 1AKI_solv_ions.gro -p topol.top -o em.tpr >> ${OUTPUT}
aprun -n 48 -N 24 mdrun_mpi_d  -v -deffnm em -g energy.log >> ${OUTPUT}

#############################################
#    $OUTPUT file to the unique results dir
# note this can be a copy or move  
mv $OUTPUT ${RESULTS}
#mv $OUTFILE ${RESULTS}

cd $HOME

###########################
# Clean up $SCRATCH 

#rm -r $SCRATCH

echo gromacs_mpi job finished at  `date`



