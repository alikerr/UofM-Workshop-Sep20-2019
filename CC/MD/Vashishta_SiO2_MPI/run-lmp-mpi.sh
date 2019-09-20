#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4            # number of MPI processes.
#SBATCH --mem-per-cpu=2500M            # memory; default unit is megabytes.
#SBATCH --time=0-00:15                 # time (DD-HH:MM).

cd $SLURM_SUBMIT_DIR

# Load the module:

module load nixpkgs/16.09  intel/2016.4  openmpi/2.1.1 lammps-omp/20170811

echo "Starting run at: `date`"

ncores=$SLURM_NTASKS

echo "Running on ${ncores}: "

lmp_exec=lmp_icc_openmpi
lmp_input="in.vashishta.sio2"
lmp_output="log_vashishta.sio2_test_${ncores}.txt"

srun ${lmp_exec} < ${lmp_input} > ${lmp_output}

echo "Program finished with exit code $? at: `date`"
