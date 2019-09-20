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

./compute_pi_c_omp_reduction.sh > log_compute_pi_c_omp_reduction.txt

./compute_pi_f90_omp_reduction.sh > log_compute_pi_f90_omp_reduction.txt

echo "Program finished with exit code $? at: `date`"
