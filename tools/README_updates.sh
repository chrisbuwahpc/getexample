#!/bin/bash

echo `pwd`
srcdir=(/home/cbording/Intern_project/getexample/src)
location=(/home/cbording/Intern_project/getexample/test_examples)
tooldir=(/home/cbording/Intern_project/getexample/tools)


test_list=`ls -l $location | grep '^d' | awk '{print $9}'`
declare -a src_list=("omp_hello.f" 
		     "hello_world.f90" 
		     "helloworld.c"
		     "hybrid_hello.f90"
		     "hello_mpi.f90"
	             "hello_hybrid.c"
		     "hello_mpi.c" 
		     "omp_hello.c")
declare -a test_str=("# is an OpenMP code "
                     "# It prints "
	             "# and runs on a single node."
	 	     "on Magnus"
	             "# https:\/\/people.sc.fsu.edu"
		     "# http:www.slac.standford.edu"	       
		     "# https:\/\/www.dartmouth.edu"
	             "# https:\/\/www.computing.llnl.edu")
arraylen=${#src_list[@]}
cd $location
echo " "
echo " in test directory" `pwd`
echo " " 
echo " "
for test_dir in $test_list ; do 

     echo "update $test_dir "
     cd $test_dir 
	for (( i=1; i<${arraylen}+1; i++));
	do 
#   echo "source code is ${src_list[$i-1]}"
	   if grep -Fq "${src_list[$i-1]}" README
	   then 
	      if [[ -f "${src_list[$i-1]}" ]]; then
		echo "need to delete ${src_list[$i-1]} from ${test_dir}"
                rm -f ${src_list[$i-1]}
		echo " search string is ${test_str[$i-1]}"

sed -i '/# It prints /a \
\# cp the SOURCEcode source code\
cp \$GE_DIR/SOURCEcode .\
\
' README    

                 sed -i "s/SOURCEcode/"${src_list[$i-1]}"/g" README
# cut section and cat info.txt to README
# find the sbatch line in the README 
                M=`grep -n "sbatch" README | grep ".slurm" | cut -d ":" -f 1`
                (( M += 1 ))
                echo cut from $M to end of file 
    
                sed -i "$M,$ d" README
    
                cat $tooldir/user_info.txt >> README  
                sed -i "s/debugq/workq/g" *.slurm
                sed -i "s/hostname/"$test_dir"/g" *.slurm

   grep -F "GE" *.slurm
   res_dir=`grep -F "_results" README | cut -d "/" -f 2 | uniq` 
   run_dir=`grep -F "run_" README | cut -d "/" -f 2 | uniq`
   echo " "  
   echo "${res_dir}"
   sed -i "s/"${res_dir}"/"${test_dir}_results"/g" README
   grep -F "_results" README 
   echo " "
   echo "${run_dir}" replace with "run_${test_dir}"
   sed -i "s/"${run_dir}"/"run_${test_dir}"/g" README
   grep -F "run_" README
   echo " "	
              fi	
	   fi
	done
     echo " "
     grep -F "SOURCEcode" README
     echo " "
     cd ..
 
     echo " " 
     
done
