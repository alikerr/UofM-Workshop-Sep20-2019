#!/bin/bash

#PBS -S /bin/bash
#PBS -l procs=4
#PBS -l pmem=2500mb
#PBS -l walltime=10:00

cd $PBS_O_WORKDIR

# Load the module:

module load intel/14.0.2.144 intel/ompi/1.6.5

echo "Starting run at: `date`"

echo "Running the code using: mpiexec"
mpiexec ./mpi-hello-world-c.x > log_mpi-hello-world-c_mpiexec.txt
mpiexec ./mpi-hello-world-f90.x > log_mpi-hello-world-f90_mpiexec.txt

echo "Running the code using: mpirun"
mpirun ./mpi-hello-world-c.x > log_mpi-hello-world-c_mpirun.txt
mpirun ./mpi-hello-world-f90.x > log_mpi-hello-world-f90_mpirun.txt

echo "Program finished with exit code $? at: `date`"
