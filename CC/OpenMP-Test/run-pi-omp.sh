#!/bin/bash

#SBATCH --ntasks=1              # number of MPI processes.
#SBATCH --cpus-per-task=4       # number of threads.
#SBATCH --mem-per-cpu=2500M     # memory; default unit is megabytes.
#SBATCH --time=0-00:05          # time (DD-HH:MM).

cd $SLURM_SUBMIT_DIR

# Load the module:

module load nixpkgs/16.09  intel/2016.4

export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK

echo "Starting run at: `date`"

./compute_pi_c_omp_reduction.sh > log_compute_pi_c_omp_reduction.txt

./compute_pi_f90_omp_reduction.sh > log_compute_pi_f90_omp_reduction.txt

echo "Program finished with exit code $? at: `date`"
