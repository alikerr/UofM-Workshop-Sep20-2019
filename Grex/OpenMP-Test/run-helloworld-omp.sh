#!/bin/bash

#PBS -S /bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l pmem=2500mb
#PBS -l walltime=10:00

cd $PBS_O_WORKDIR

# Load the module:

module load intel/14.0.2.144

export OMP_NUM_THREADS=$PBS_NUM_PPN

echo "Starting run at: `date`"

./helloworld_loop_c_omp.sh > log_helloworld_loop_c_omp.txt

./helloworld_loop_f90_omp.sh > log_helloworld_loop_f90_omp.txt

echo "Program finished with exit code $? at: `date`"
