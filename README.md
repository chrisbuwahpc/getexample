# getexample

The getexample tool provide users on a supercomputing resource a fast an easy
way to begin using the resource.  The example directories are copied to the 
users directory and should straight forward to run.  The information in the 
files and scripts provide a templates that the users should be able to edit 
easily to run "their" jobs on the system. 


# Notes for using SLURM on Kaya the UWA compute cluster. 

Some useful SLURM variables associated with SBATCH

SLURM_SUBMIT_DIR is the directory from which the SBATCH command was run.

The slurm job scripts use some standard local variable to make the scripts
consistent regardless of the job/example type.

JOBID=$SLURM_JOBID is just a convention used to make the examples file readable.

SCRATCH is the path to the directory where the job will run and it uses

Please email colbrydi@msu.edu if you are interested in this project.

