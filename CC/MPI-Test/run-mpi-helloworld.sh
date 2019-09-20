#!/bin/bash

#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=8     # number of MPI processes.
#SBATCH --mem-per-cpu=2500M     # memory; default unit is megabytes.
#SBATCH --time=0-00:05          # time (DD-HH:MM).

cd $SLURM_SUBMIT_DIR

# Load the module:

module load nixpkgs/16.09  intel/2016.4 openmpi/2.1.1

echo "Starting run at: `date`"

echo "Running the code using: srun"
srun ./mpi-hello-world-c.x > log_mpi-hello-world-c_srun.txt
srun ./mpi-hello-world-f90.x > log_mpi-hello-world-f90_srun.txt

echo "Running the code using: mpiexec"
mpiexec -n $SLURM_NTASKS ./mpi-hello-world-c.x > log_mpi-hello-world-c_mpiexec.txt
mpiexec -n $SLURM_NTASKS ./mpi-hello-world-f90.x > log_mpi-hello-world-f90_mpiexec.txt

echo "Running the code using: mpirun"
mpirun -np $SLURM_NTASKS ./mpi-hello-world-c.x > log_mpi-hello-world-c_mpirun.txt
mpirun -np $SLURM_NTASKS ./mpi-hello-world-f90.x > log_mpi-hello-world-f90_mpirun.txt

echo "Program finished with exit code $? at: `date`"
