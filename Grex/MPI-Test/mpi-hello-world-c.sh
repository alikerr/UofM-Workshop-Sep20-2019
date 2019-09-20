#!/bin/bash

program_root="mpi-hello-world-c"
ncores=4
program_exec=${program_root}".x"

if [ -f "${program_exec}" ] ; then
   echo "Running the program: ${program_exec} - using ${ncores} - `date`"
   echo "                                             "
   echo "Running the code using: mpiexec"
   mpiexec -n ${ncores} ${program_exec}
   echo "                                             "
   echo "Running the code using: mpiexec"
   mpirun -np ${ncores} ${program_exec}
else
   echo ""
   echo "There is no program [ ${program_exec} ] to run - Start by compiling the program."
fi
echo "Done"
