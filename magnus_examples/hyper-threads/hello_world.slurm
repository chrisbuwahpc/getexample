#!/bin/bash --l

# SLURM directives
#
# Here we specify to SLURM we want one node (--nodes=1) with
# a wall-clock time limit of 1 hours (--time=01:00:00)
#
# Replace hello_mpi.f90 with the appropriate job name
# following --account (e.g., --account=project123)

#SBATCH --nodes=1
#SBATCH --time=00:05:00
#SBATCH --account=hello_mpi.f90
#SBATCH --export= NONE

# To launch the job, we specify to aprun 48 MPI tasks (-n 48)
# required (-n 48) with 48 MPI tasks on the node (-N 48)
# These tasks are accommodated using hyper-threading with
# two (hyper-) threads per core (-j 2).

# There is no OpenMP: OMP_NUM_THREADS=1

export OMP_NUM_THREADS=1
aprun -n 48 -N 48 ./hello_mpi.f90
