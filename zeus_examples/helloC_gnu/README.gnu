#!/bin/bash
# This is the README file is an executable script.
# To run type: ./README
#
# Example OBJECTIVE: to demostrate helloworld with intel compiler 
# on Zeus. 
# 
# To run this code, edit the partition and 
# load the necessary modules.
# This information is located under hello_gnu_c.slurm
# You can edit the SLURM as: emacs hello_gnu_c.slurm &

# SLURM directives
# 
# Here we specify to SLURM we want 1 node (--nodes=1)
# Change the partition  (--partition==workq)
# Add #SBATCH --gres=gpu:1
# Load the necessary modules before module listing.
# module load gcc

# To compile the helloworld.intel code
gcc -O2 helloworld.c -o helloworld_zeus_gnu

# To submit the job to Magnus
sbatch hello_gnu_c.slurm

echo "The sbatch command returns what jobid is for this job."
echo "To check the status of your job, use the slurm command:"
echo "squeue -u $USER"
echo "Your job is deleted from the scratch."
echo "It is now moved to your group."
echo "Your results are now located in ${MYGROUP}/hello_zeus_gnu_results/"
echo "To change to your jobID directory, type:"
echo "cd ${MYGROUP}/helloworld_zeus_gnu_results/jobID/"
echo "To view the results, use the cat command and type:"
echo "cat helloworld_gnu.log"
