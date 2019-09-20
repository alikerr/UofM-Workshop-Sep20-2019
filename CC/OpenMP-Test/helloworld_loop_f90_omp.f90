!==============================================================================
! Simple Hello World program: OpenMP Version.
!
! Compile with:
! - gfortran -fopenmp helloworld_loop_f90_omp.f90 helloworld_loop_f90_omp
! - ifort -openmp helloworld_loop_f90_omp.f90 helloworld_loop_f90_omp
!==============================================================================

program Hello_World

  use omp_lib

  implicit none
  integer :: ID
  integer :: nthreads
  integer, parameter :: nloops = 8
  integer :: i

!$omp parallel shared (nthreads) private(ID) 
        
  ID = omp_get_thread_num()

  ! Let us store the variable nthreads. Pick one thread to store it (ID = 0)

  if ( ID == 0 ) nthreads = omp_get_num_threads() 

  ! Here, we replace the previous line by a single construct.

!$omp single
   nthreads = omp_get_num_threads() 
!$omp end single

!$omp do

  do i = 0, nloops - 1
     write(*,fmt="(a,I2,a,I2,a,I2,a)") &
          & "Hello World!, My ID is equal to [ ", ID, " of ",nthreads, " ] - I get the value [ ",i, "]"
  end do

!$omp end do 

!$omp end parallel

end program Hello_World

!==============================================================================
! End of the program Hello World.
!==============================================================================
