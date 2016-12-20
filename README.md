# getexample

The getexample tool provide users on a supercomputing resource a fast an easy
way to begin using the resource.  The example directories are copied to the 
users directory and should straight forward to run.  The information in the 
files and scripts provide a templates that the users should be able to edit 
easily to run "their" jobs on the system. 


# Notes for the Pawsey Supercomputing System using SLURM 

Some useful SLURM VARIABLE associated with SBATCH
How to set the SBATCH_ACCOUNT variable from the $MYGROUP system variable local to 
the Pawsey Supercomputing Center.
#export SBATCH_ACCOUNT=`echo $MYGROUP | awk 'BEGIN{FS="/"}{print $3}'`

SLURM_SUBMIT_DIR is the directory from which the SBATCH command was run.

The slurm job scripts use some standard local variable to make the scripts
consistent regardless of the job/example type.

JOBID=$SLURM_JOBID is used to so that we future proof the examples if we change resource manangers and make it 
easier to read for new users.

SCRATCH is the path to the directory where the job will run and it uses

Please email colbrydi@msu.edu if you are interested in this project.

