#!/bin/bash

#PBS -S /bin/bash
#PBS -l procs=1
#PBS -l mem=2500mb
#PBS -l walltime=30:00

cd $PBS_O_WORKDIR

# Load the module:

module load lammps/11aug17

echo "Starting run at: `date`"

lmp_exec=lmp_grex
lmp_input="in.vashishta.sio2"
lmp_output="log_vashishta.sio2_test.txt"

${lmp_exec} < ${lmp_input} > ${lmp_output}

echo "Program finished with exit code $? at: `date`"
