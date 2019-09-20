# Makefile to compile a selection of programs

# Choose a compiler: INTEL or GNU [GNU is set as default]

COMP = "GNU"

# C/C++ programs.

EXE_CPP_MPI = mpi-hello-world-c.x

# Fortran Programs.

EXE_F90_MPI = mpi-hello-world-f90.x

EXES = $(EXE_CPP_MPI) $(EXE_F90_MPI)

# Compilers and flags

# GNU compilers:
 
ifeq ($(COMP),"GNU")
  CC = mpicc
  FC = mpif90
endif

# Intel compilers:

ifeq ($(COMP),"INTEL")
  CC = mpicc
  FC = mpif90
endif

all: help clean $(EXES) 

help: 
	@echo "                                                                " 
	@echo "================================================================"
	@echo " The default compilers are set to GNU: gcc and gfortran.        "
	@echo " To use Intel compilers (icc and ifort):                        "
	@echo " Edit Makefile and change the variable COMP from GNU to INTEL   "
	@echo "================================================================"
	@echo "                                                                "
	@echo " To clean the directory: make clean                             "
	@echo "                                                                "

$(EXE_CPP_MPI): %.x : %.c
	@echo "===== Compiling $^ using $(CC) compiler ====="
	$(CC) $^ -o $@

$(EXE_F90_MPI): %.x : %.f90
	@echo "===== Compiling $^ using $(FC) compiler ====="
	$(FC) $^ -o $@

##.PHONY: help all clean spotless

clean:
	@rm -f $(EXES)
#
