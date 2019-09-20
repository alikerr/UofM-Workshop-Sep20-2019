#!/bin/bash

program_root="helloworld_c_seq"

program_exec=${program_root}".x"

if [ -f "${program_exec}" ] ; then
   echo "Running the program: ${program_exec} - `date`"
   echo "                                             "

   ./${program_exec}
else
   echo "There is no program [ ${program_exec} ] to run - Start by compiling the program."
fi
echo "  "; echo "Done"; echo "   "
