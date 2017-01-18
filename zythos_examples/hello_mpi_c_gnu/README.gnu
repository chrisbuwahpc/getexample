#!/bin/bash --login
# This is the README file is an executable script.
# To run type: ./README.gnu
#
# Example OBjECTIVE: to demostrate hello_mpi.c example
# on Zythos with GNU compiler. 
# This code is an MPI example that requests 4 nodes with 6 cores each
# giving 24 cores in total.
# This example is taken from:
# https://www.dartmouth.edu/~rc/classes/intro_mpi/hello_world_ex.html
# To run this code, we need to edit the partition, the number of nodes
# and cores and load the necessary modules.
# This information is located under hello_mpi_intel.slurm
# You can edit the SLURM as: emacs hello_mpi_intel.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 4 nodes (--ntasks=2)
# Then, we modify the partition to --partition==zythos
# We also specify total number of cores per node. (--cpus-per-task=6)
# To run this code correctly on Zythos, we need to remove --export=NONE
# If it is still included in the SLURM, the code does not compile.
# To compile the code with GNU compiler, we need to load gcc as shown below:
# module load gcc
# We then load the necessary modules before module listing.
# module load mpt
# We also specify to mpirun that there are 24 cores in total (-np 24)
# Therefore, the mpirun command looks like:
# mpirun -np 24 ./$EXECUTABLE >> ${OUTPUT}
 
# To compile the hello_mpi.c code with GNU
mpicc hello_mpi.c -I${FPATH} -o hello_mpi_gnu

# To submit the job to Zeus
sbatch hello_mpi_gnu.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_mpi_results_zythos/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/hello_mpi_results_zythos/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat hello_mpi_gnu.log"

