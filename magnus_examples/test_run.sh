#!/bin/bash
# This script tests if all codes for Magnus work.

# Look for magnus_results.log
# Remove this file initially to create it each time
# the program runs.
rm magnus_results.log  

# Change the directory to Magnus
cd getexample/magnus_examples/

DIRECTORY=("fortran_helloworld_cray" 
           "fortran_helloworld_intel" 
	   "fortran_helloworld_gnu")

tLen=${#DIRECTORY[@]}

for ((i=0; i<${tLen}; i++))

do

cd ${DIRECTORY[$i]}
./README

cd ..

done
