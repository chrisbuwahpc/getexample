#!/bin/bash

echo `pwd`
srcdir=(/home/cbording/Intern_project/getexample/src)
location=(/home/cbording/Intern_project/getexample/test_examples)
#cd $srcdir
#for file in *
#do 
#  echo source file $file
#done
#  echo `pwd`

test_list=`ls -l $location | grep '^d' | awk '{print $9}'`
cd $location
for test_dir in $test_list ; do 

     echo "update $test_dir "
     cd $test_dir 

# search strings for sed update
# fortran_helloOpenMP_*
# "# is an OpenMP code " -> omp_hello.f 

# fortran_helloworld_*
# "# It prints " -> hello_world.f90

# helloC_*
# "# and runs on a single node." -> helloworld.c

# fortranHybrid_*
# "on Magnus" -> hybrid_hello.f90

# fortranMPI_*
# "# https:\/\/computing.llnl.edu" -> hello_mpi.f90

# hello_hybrid_c_* 
# "# http:www.slac.stanford.edu" -> hello_hybrid.c 

# hello_mpi_c_*
# "# https:\/\/www.dartmouth.edu" -> hello_mpi.c

#  hello_NUMA_*
# "# https:\/\/computing.llnl.edu" -> omp_hello.c 

# helloOmp_*C
# "# https:\/\/computing.llnl.edu" -> omp_hello.c

# partially_occupied_nodes_*
# "# https:\/\/people.sc.fsu.edu" -> hello_mpi.f90

# task_placement_*
# "# https:\/\/people.sc.fsu.edu" -> hello_mpi.f90

# thread_placement_*
# "on Magnus" -> hybrid_hello.f90



if [[ -f hybrid_hello.f90 ]]; then
    echo "delete hybrid_hello.f90"
    rm hybrid_hello.f90
 

sed -i '/on Magnus/a \
\# cp the hybrid_hello.f90 source code\
cp \$GE_DIR/hybrid_hello.f90 .\
\
' README

# add link to pawsey doc
sed -i '/echo "squeue -u \$USER"/a \
\" \"\
' README

sed -i "s/Your job is deleted from the scratch/Your job will be run in \$MYSCRATCH/g" README
sed -i "s/It is now moved to your group./ /g" README

sed -i '/echo \"cat /a \
echo \" \"\
echo \"more information about Magnus can be found at:\"\
echo \" https://support.pawsey.org.au/documentation/display/US/Magnus+User+Guide\"\
echo \" \"\
echo \"more information about SLURM and aprun can be found at:\"\
echo \" https://support.pawsey.org.au/documentation/display/US/Scheduling+and+Running+Jobs\"\
\
' README
fi

      sed -i "s/debugq/workq/g" *.slurm 

     echo " "
     cd ..
done

#done
