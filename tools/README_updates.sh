#!/bin/bash

echo `pwd`

location=(/home/chris/Intern_project/getexample/magnus_examples)

test_list=`ls -l $location | grep '^d' | awk '{print $9}'`
cd $location
for test_dir in $test_list ; do 

     echo "update $test_dir "
     cd $test_dir 

sed -i '/\# is an OpenMP/a \
\# cp the omp_hello.f source code\
cp \$GE_DIR/src/omp_hello.f .\
\
' README


     echo " "
     cd ..

done
