 
/gpfs/paragon/local/apps/Modules/modulefiles/production:/gpfs/paragon/local/apps/Modules/modulefiles/packages:/gpfs/paragon/local/apps/Modules/modulefiles/other:/gpfs/paragon/local/apps/Modules/modulefiles/visualisation:/gpfs/panther/local/apps/Modules/modulefiles/production:/gpfs/panther/local/apps/Modules/modulefiles/packages:/gpfs/panther/local/apps/Modules/modulefiles/other:/gpfs/panther/local/apps/Modules/modulefiles/visualisation:/gpfs/fairthorpe/local/apps/lmod/lmod/modulefiles/Core:/gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps:/gpfs/panther/local/HCP004/pxs01/software/rhel7/modulefiles/apps:/gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps

Currently Loaded Modules:
  1) StdEnv   2) xalt/1.1.2   3) use.paragon

 


----------- /gpfs/paragon/local/apps/Modules/modulefiles/production ------------
   camfort/0.901          papi-gcc/5.5.1
   clang/3.8.1            papi/5.4.1
   cmake/3.4.1            perl5/5.20.3-thread-multi
   cmake/3.6.2            perl5/5.20.3              (D)
   cmake/3.7.1            pgi/pgi/18.10
   cmake/3.10.2    (D)    pgi/17.4
   cuda/8.0        (D)    pgi/18.10                 (D)
   cuda/9.0               python2/anaconda
   cuda/9.2               python2/2.7.8             (D)
   gcc/5.4.0              python3/anaconda
   gcc6/6.4.0             python3/3.6.0             (D)
   gcc7/7.1.0             spectrum_mpi/10.1.0
   ibm/13.1.3             swig/3.0.10
   ibm/13.1.5      (D)    utilities
   ibmmpi/xl.debug        utilities-fen
   ibmmpi/xl.perf  (D)    utilities-gcc
   ibmmpi/xl.trace        xalt/1.1.2                (L)
   java/8.0               xlc/16.1.1.0-180913
   lmod/6.5               xlc/16.1.1.0-181102       (D)
   mysql/5.7.17           xlf/16.1.1.0-180913
   nano/2.5.3             xlf/16.1.1.0-181102       (D)
   ofc/27Oct16

------------ /gpfs/paragon/local/apps/Modules/modulefiles/packages -------------
   amgx-gcc/unstable                  lammps/22Aug18      (D)
   biobuilds/2016.11                  namd/2.12
   caffe/bvlc                         namd/2018_10_10     (D)
   caffe/ibm                   (D)    nltk/3.2.5
   castep/16.11                       openai_gym/0.10.8
   code_saturne-gcc/gpu-beta          opencv-gcc/2.4.0
   code_saturne-gcc/nogpu-beta        openfoam-gcc7/v1806
   code_saturne-gcc/5.0.4      (D)    openfoam-gcc7/5.0   (D)
   dlpoly/4.08                        ranger/1.8.1
   go/1.9.2                           spark/2.1.0.1
   gromacs-gcc/5.1.4                  spark/2.1.1         (D)
   gromacs-gcc/2016.1          (D)    tensorflow/ibm      (D)
   gromacs/2016.1                     tensorflow/1.0.1
   hdf5-parallel-gcc/1.10.2           tensorflow/1.2.1
   keras/1.2.2                        tensorflow/1.4.0
   keras/2.0.3                 (D)    theano/0.9.0
   lammps/17Nov16

-------------- /gpfs/paragon/local/apps/Modules/modulefiles/other --------------
   boost-gcc/1.53.0    ibmpessl/5.2             openmpi-gcc/3.0.0  (g)
   fftw2/2.1.5         mvapich2-gcc/2.2         openmpi-gcc/3.1.2  (g,D)
   fftw3-gcc/3.3.4     mvapich2/2.2             openmpi-pgi/1.10.2 (D)
   fftw3/3.3.5         netcdf/4.3.3             openmpi-pgi/2.1.2
   git/2.9.5           netcdf/4.4.1      (D)    openmpi/2.0.2
   hdf5/1.10.1         node.js/10.10.0
   ibmessl/5.4         openmpi-gcc/2.0.2

---------- /gpfs/paragon/local/apps/Modules/modulefiles/visualisation ----------
   gnuplot/5.2.2         paraview-egl/5.5.2        viz
   paraview-egl/5.5.0    paraview-egl/5.6.0 (D)

------- /gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps -------
   boost/1.65.1    gromacs/2018.4    pixman/0.34.0
   fftw/3.3.8      openmpi/3.0.1     tcl/8.6.8

  Where:
   D:  Default Module
   L:  Module is loaded
   g:  built for GPU

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".


	general utilities loaded

	GCC-6.4.0 environment now loaded

	CUDA-9.2 loaded

	CUDA-9.2 loaded

        Python 3.6.0 modules are now loaded in your environment.

            Notes:
              - scipy compiled with 3.7.0 lapack
              - For mpi4py use openmpi-gcc
              - For h5py load also hdf5-gcc

Lmod has detected the following error: The following module(s) are unknown:
"StdEnv" "use.paragon"

Please check the spelling or version number. Also try "module spider ..."
It is also possible your cache file is out-of-date; it may help to try:
  $ module --ignore-cache load "StdEnv" "use.paragon"

Also make sure that all modulefiles written in TCL start with the string
#%Module

Executing this command requires loading "StdEnv" which failed while processing
the following module(s):

    Module fullname  Module Filename
    ---------------  ---------------
    gromacs/2018.4   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps/gromacs/2018.4Executing this command requires loading "use.paragon" which failed while
processing the following module(s):

    Module fullname  Module Filename
    ---------------  ---------------
    gromacs/2018.4   /gpfs/paragon/local/HCP004/pxs01/software/rhel7/modulefiles/apps/gromacs/2018.4



Currently Loaded Modules:
  1) StdEnv   2) xalt/1.1.2   3) use.paragon

 

/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01
 
SCRATCH is /gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/run_gromacs/10523765
 
total 0
drwxr-xr-x 2 rrb67-pxs01 pxs01  4096 Jan  4 11:51 .
drwxr-xr-x 7 rrb67-pxs01 pxs01  4096 Jan  4 11:51 ..
-rw-r--r-- 1 rrb67-pxs01 pxs01 27017 Jan  4 11:51 1aki.pdb.gz
/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/.lsbatch/1546602653.13552516.shell: line 75: gmx_mpi_d: command not found
/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/.lsbatch/1546602653.13552516.shell: line 77: gmx_mpi_d: command not found
/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/.lsbatch/1546602653.13552516.shell: line 81: gmx_mpi_d: command not found
/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/.lsbatch/1546602653.13552516.shell: line 82: gmx_mpi_d: command not found
/gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/.lsbatch/1546602653.13552516.shell: line 84: gmx_mpi_d: command not found
gromacs_ex1 job finished at Fri Jan 4 11:51:14 GMT 2019

------------------------------------------------------------
Sender: LSF System <lsfadmin@pge322>
Subject: Job 10523765: <GE-gromacs_ex1> in cluster <paragon> Done

Job <GE-gromacs_ex1> was submitted from host <hcplogin1> by user <rrb67-pxs01> in cluster <fairthorpe> at Fri Jan  4 11:51:03 2019.
Job was executed on host(s) <pge322>, in queue <fairthorpe>, as user <rrb67-pxs01> in cluster <paragon> at Fri Jan  4 11:51:05 2019.
</gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01> was used as the home directory.
</gpfs/paragon/local/HCP004/pxs01/rrb67-pxs01/scripts/getexample/paragon_dev/gromacs> was used as the working directory.
Started at Fri Jan  4 11:51:05 2019.
Terminated at Fri Jan  4 11:51:14 2019.
Results reported at Fri Jan  4 11:51:14 2019.

Your job looked like:

------------------------------------------------------------
# LSBATCH: User input
#!/bin/bash --login 
#BSUB -J GE-gromacs_ex1
#BSUB -o gromacs-%J.e
#BSUB -e gromacs-%J.e
#BSUB -q paragon
#BSUB -n 1
##BSUB -x 
#BSUB -W 00:10
## this is full path to the data file xhelloworld_gnu
#BSUB -data /gpfs/cds/local/HCP004/pxs01/rrb67-pxs01/scripts/getexample/panther_examples/helloC_gnu/helloworld_gnu
#######

echo " "
echo $MODULEPATH

#if [ -d /gpfs/paragon/local/apps/Modules/modulefiles ]; then
#    ls -al /gpfs/paragon/local/apps/Modules/modulefiles 
#else
#    echo $MODULEPATH
#    echo no modules on paragon
#    exit
#fi

data_in=1aki.pdb
# Default loaded compiler module is gcc module.
# To compile with the GNU compiler, load the gcc module in case.
module list 
module avail 
#module swap use.panther use.paragon 
module load gcc6/6.4.0 openmpi/3.0.1 gromacs/2018.4 

# leave in, it lists the environment loaded by the modules
module list

#  Note: LSF_JOBID is a unique number for every job.
#  These are generic variables
echo $PG
EXECUTABLE=gmx_mpi_d
WORKDIR=${PG}/run_gromacs
SCRATCH=$WORKDIR/$LSB_REMOTEJID

###############################################
# Creates a unique directory in the SCRATCH directory for this job to run in.
if [ ! -d $SCRATCH ]; then 
    mkdir -p $SCRATCH 
fi 
echo " "
echo SCRATCH is $SCRATCH
echo " " 
###############################################

(... more ...)
------------------------------------------------------------

Successfully completed.

Resource usage summary:

    CPU time :                                   5.00 sec.
    Max Memory :                                 19 MB
    Average Memory :                             4.00 MB
    Total Requested Memory :                     -
    Delta Memory :                               -
    Max Swap :                                   -
    Max Processes :                              8
    Max Threads :                                10
    Run time :                                   9 sec.
    Turnaround time :                            11 sec.

The output (if any) is above this job summary.

