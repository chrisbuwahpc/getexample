#!/bin/bash

echo `pwd`
srcdir=(/group/pawsey0001/getexample/src)
location=(/group/pawsey0001/getexample/test_examples)
tooldir=(/group/pawsey0001/getexample/tools)


test_list=`ls -l $location | grep '^d' | awk '{print $9}'`
declare -a src_list=("omp_hello.f" 
		     "hello_world.f90" 
		     "hybrid_hello.f90"
		     "hello_mpi.f90"
		     "helloworld.c"
	             "hello_hybrid.c"
		     "hello_mpi.c" 
		     "omp_hello.c")
#declare -a test_str=("# https:\/\/computing.llnl.gov\/tutorials\/openMP\/exercise.html"
#                     "# and runs on a single node."
#	             "# which includes both MPI and OpenMP jobs."
#	 	     "# https:\/\/people.sc.fsu.edu "
#	             "# To run this code"
#		     "# http:\/\/www.slac.standford.edu"	       
#		     "# https:\/\/www.dartmouth.edu"
#	             "# https:\/\/www.computing.llnl.gov")
#arraylen=${#src_list[@]}
cd $location
echo " "
echo " in test directory" `pwd`
echo " " 
echo " "
for test_dir in $test_list ; do 

    echo "update $test_dir "
    cd $test_dir 
#	for (( i=1; i<${arraylen}+1; i++));
#	do 
#    echo "source code is ${src_list[$i-1]}"
#	   if grep -Fq "${src_list[$i-1]}" README
#	   then 
#	      if [[ -f "${src_list[$i-1]}" ]]; then
#		echo "need to delete ${src_list[$i-1]} from ${test_dir}"
#                rm -f ${src_list[$i-1]}
#		echo " search string is ${test_str[$i-1]}"

    SOURCE="omp_hello.c"
    if grep -Fq "${SOURCE}" README  
    then
	if [[ -f ${SOURCE} ]]; then
	    echo "delete ${SOURCE}"
	    rm ${SOURCE}
	fi 

# add  a blank line 
	set -i '/module load/a \
\
' README


	sed -i '/# https:\/\/computing.llnl.gov\/tutorials/a \
\# cp the SOURCEcode source code\
cp \$GE_DIR/src/SOURCEcode .\
\
' README    

	sed -i "s/correctl, we/correctly, we/g" README
	sed -i "s/# We then change the partition to --partition=workq//g" README
	sed -i "s/# We the modify the partition to --partition==workq//g" README
	sed -i "s/# To run this code, we need to edit the partition,//g" README
	sed -i "s/# load the necessary modules/# To run this code load the necessary modules./g" README 

	sed -i "s/# omp_hello.f/# omp_hello.c/g" README

	sed -i "s/SOURCEcode/"${SOURCE}"/g" README
# cut section and cat info.txt to README
# find the sbatch line in the README 
	M=`grep -n "sbatch" README | grep ".slurm" | cut -d ":" -f 1`
	(( M += 1 ))
	echo cut from $M to end of file 
    
	sed -i "$M,$ d" README
    
	cat $tooldir/zeus_info.txt >> README  
	sed -i "s/debugq/workq/g" *.slurm
	sed -i "s/hostname/"$test_dir"/g" *.slurm
        
	       

	grep -F "GE" *.slurm
	res_dir=`grep -F "_results" README | cut -d "/" -f 2 | uniq` 
	res_dir2=`grep -F "_results" *.slurm | cut -d "/" -f 2 | uniq` 
	run_dir=`grep -F "run_" README | cut -d "/" -f 2 | uniq`
	logfile=`grep -F "OUTPUT=" *.slurm | cut -d "=" -f 2`
	echo " "  
	echo "${res_dir}"
	sed -i "s/"${res_dir}"/"${test_dir}_results_zeus"/g" README
	sed -i "s/"${res_dir2}"/"${test_dir}_results_zeus"/g" *.slurm
        sed -i "s/"${logfile}"/"${test_dir}.log"/g" *.slurm
	grep -F "_results" README 
	echo " "
	echo "${run_dir}" replace with "run_${test_dir}"
	sed -i "s/"${run_dir}"/"run_${test_dir}"/g" README
	grep -F "run_" README
	echo " "	
	sed -i "s/thread_placement_cray.log/${test_dir}.log/g" README 
	echo " "
	grep -F "SOURCEcode" README
	echo " "
    fi
    cd ..
    
done
