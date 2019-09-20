# Makefile to compile a selection of OpenMP programs

# Choose a compiler: INTEL or GNU [GNU is set as default]

COMP = "INTEL"

# C/C++ programs.

EXE_CPP_OMP = helloworld_loop_c_omp.x compute_pi_c_omp_reduction.x

# Fortran Programs.

EXE_F90_OMP = helloworld_loop_f90_omp.x compute_pi_f90_omp_reduction.x 

EXES = $(EXE_CPP_OMP) $(EXE_F90_OMP) 

# Compilers and flags

# GNU compilers:
 
ifeq ($(COMP),"GNU")
  CC = gcc
  FC = gfortran
  OMP_FLAGS = -fopenmp
endif

# Intel compilers:

ifeq ($(COMP),"INTEL")
  CC = icc
  FC = ifort
  OMP_FLAGS = -qopenmp
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

$(EXE_CPP_OMP): %.x : %.c
	@echo "===== Compiling $^ using $(CC) compiler ====="
	$(CC) $(OMP_FLAGS) $^ -o $@

$(EXE_F90_OMP): %.x : %.f90
	@echo "===== Compiling $^ using $(FC) compiler ====="
	$(FC) $(OMP_FLAGS) $^ -o $@

##.PHONY: help all clean spotless

clean:
	@rm -f $(EXES)
#
