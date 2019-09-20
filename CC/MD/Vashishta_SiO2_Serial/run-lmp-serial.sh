#!/bin/bash

#SBATCH --ntasks=1                     # number of MPI processes.
#SBATCH --mem-per-cpu=2500M            # memory; default unit is megabytes.
#SBATCH --time=0-00:30                 # time (DD-HH:MM).

cd $SLURM_SUBMIT_DIR

# Load the module:

module load nixpkgs/16.09  intel/2016.4  openmpi/2.1.1 lammps-omp/20170811

echo "Starting run at: `date`"

lmp_exec=lmp_icc_openmpi
lmp_input="in.vashishta.sio2"
lmp_output="log_vashishta.sio2_test.txt"

${lmp_exec} < ${lmp_input} > ${lmp_output}

echo "Program finished with exit code $? at: `date`"
