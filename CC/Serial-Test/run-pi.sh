#!/bin/bash

#SBATCH --ntasks=1              # number of MPI processes.
#SBATCH --mem-per-cpu=2500M     # memory; default unit is megabytes.
#SBATCH --time=0-00:05          # time (DD-HH:MM).

cd $SLURM_SUBMIT_DIR

# Load the module:

module load nixpkgs/16.09  intel/2016.4

echo "Starting run at: `date`"

./compute_pi_c_seq.sh > log_compute_pi_c_seq.txt  

./compute_pi_f90_seq.sh > log_compute_pi_f90_seq.txt

echo "Program finished with exit code $? at: `date`"
