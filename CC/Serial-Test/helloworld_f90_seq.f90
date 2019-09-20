!==============================================================================
! Simple Hello World program: Serial Version.
!
! Compile with:
! - gfortran helloworld_f90_seq.f90 -o helloworld_f90_seq
! - ifort helloworld_f90_seq.f90 -o helloworld_f90_seq 
!==============================================================================

program Hello_World

  implicit none
  integer :: ID

  ID = 0

  write(*,fmt="(a,I2,a)") "Hello World!, My ID is equal to [ ", ID, " ]."

end program Hello_World

!==============================================================================
! End of the program Hello World.
!==============================================================================
