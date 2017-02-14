#!/bin/bash

echo `pwd`

location=(/group/interns2016/getexample/magnus_examples)

test_list=`ls -l $location | grep '^d' | awk '{print $9}'`
cd $location
for test_dir in $test_list ; do 
#   if [[ "${test_dir}" = "helloC_cray" || "${test_dir}" = "helloC_gnu" || "${test_dir}" = "helloC_intel" ]]; then

     echo "update $test_dir "
     cd $test_dir 

     sed -i "s/hostname/${test_dir}/g" *.slurm
     sed -i "s/debugq/workq/g" *.slurm 

     echo " "
     cd ..
done
