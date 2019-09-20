!==============================================================================
! Simple Hello World program: Serial Version.
!
! Compile with:
! - gfortran hello_f90_seq.f90 -o hello_f90_seq
! - ifort hello_f90_seq.f90 -o hello_f90_seq 
!==============================================================================

program Hello_World

  implicit none

  write(*,fmt="(a)") "Hello World!"

end program Hello_World

!==============================================================================
! End of the program Hello World.
!==============================================================================
