#!/bin/bash

#PBS -S /bin/bash
#PBS -l procs=1
#PBS -l mem=2500mb
#PBS -l walltime=10:00

cd $PBS_O_WORKDIR

# Load the module:

module load intel/14.0.2.144

echo "Starting run at: `date`"

./compute_pi_c_seq.sh > log_compute_pi_c_seq.txt  

./compute_pi_f90_seq.sh > log_compute_pi_f90_seq.txt

echo "Program finished with exit code $? at: `date`"
