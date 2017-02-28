#!/bin/bash

echo `pwd`
srcdir=(/group/pawsey0001/getexample/src)
location=(/group/pawsey0001/getexample/magnus_examples)
tooldir=(/group/pawsey0001/getexample/tools)

test_list=`ls -l $location | grep '^d' | awk '{print $9}'`
cd $location
for test_dir in $test_list ; do 

# update README
     echo "update $test_dir "
     cd $test_dir 
     sed -i '/"is an environment variable it is set to \$MYGROUP"/a \
echo " example:  cd \\$MYGROUP "\
' README 

     sed -i "s/thread_placement_cray.log/${test_dir}.log/g" README 

# update slurm file 
     
     logfile=`grep -F "OUTPUT=" *.slurm | cut -d "=" -f 2`
     sed -i "s/"${logfile}"/"${test_dir}.log"/g" *.slurm
     grep -F ".log" *.slurm
     cd ..
done


