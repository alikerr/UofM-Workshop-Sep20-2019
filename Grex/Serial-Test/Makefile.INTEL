# Makefile to compile a selection of programs

# Choose a compiler: INTEL or GNU [GNU is set as default]

COMP = "INTEL"

# C/C++ programs.

EXE_CPP_SEQ = hello_c_seq.x helloworld_c_seq.x compute_pi_c_seq.x 

# Fortran Programs.

EXE_F90_SEQ = hello_f90_seq.x helloworld_f90_seq.x compute_pi_f90_seq.x

EXES = $(EXE_CPP_SEQ) $(EXE_F90_SEQ)

# Compilers and flags

# GNU compilers:
 
ifeq ($(COMP),"GNU")
  CC = gcc
  FC = gfortran
endif

# Intel compilers:

ifeq ($(COMP),"INTEL")
  CC = icc
  FC = ifort
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

$(EXE_CPP_SEQ): %.x : %.c
	@echo "===== Compiling $^ using $(CC) compiler ====="
	$(CC) $^ -o $@

$(EXE_F90_SEQ): %.x : %.f90
	@echo "===== Compiling $^ using $(FC) compiler ====="
	$(FC) $^ -o $@

##.PHONY: help all clean spotless

clean:
	@rm -f $(EXES)
#
