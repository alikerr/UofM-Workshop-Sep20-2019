!==============================================================================
! Simple Hello World program: MPI Version.
!
! Compile with:
!   mpif90 mpi-hello-world-f90.f90 -o mpi-hello-world-f90.x
!==============================================================================

program hello

  include 'mpif.h'
  integer rank, size, ierror, tag

  call MPI_INIT(ierror)
  call MPI_COMM_SIZE(MPI_COMM_WORLD, size, ierror)
  call MPI_COMM_RANK(MPI_COMM_WORLD, rank, ierror)
  print*, 'Hello world from process ', rank, '      of ', size
  call MPI_FINALIZE(ierror)
end program hello

! End of the program.
