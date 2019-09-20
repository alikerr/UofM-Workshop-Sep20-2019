#!/bin/bash

program_root="helloworld_loop_f90_omp"

program_exec=${program_root}".x"

if [ -f "${program_exec}" ] ; then
   echo "Running the program: ${program_exec} - `date`"
   echo "                                             "

   for NTHREADS in 1 2 3 4 ; do
     echo " "
     echo "Running the program: ${program_exec} :: Using ${NTHREADS} cores."
     echo " "
     export OMP_NUM_THREADS=${NTHREADS}
     ./${program_exec}
     echo " "
   done
else
   echo "There is no program [ ${program_exec} ] to run - Start by compiling the program."
fi
echo "Done"; echo " "
