! ==============================================================================
! Simple Compute Pi program: Serial Version. 
! Compile with:
!   gfortran ompute_pi_f90_seq.f90 -o compute_pi_f90_seq
!   ifort compute_pi_f90_seq.f90 -o compute_pi_f90_seq
! ==============================================================================

program compute_pi

   implicit none
   integer, parameter :: nb_steps = 20000000         ! Number of steps.
   real(8), parameter :: step     = 1.0d0/nb_steps   ! Width of the small rectangle.
   real(8) :: pi, sum, x
   real(8) :: start_time, end_time, elapsed_time     ! Time variables to compute the cpu time used.
   integer :: i

   call cpu_time(start_time)                 ! Get the start time.

   sum = 0.0d0                               ! Initialize the sum variable.  

   do i = 0, nb_steps                        ! Loop over the number of steps. 
     x = (i + 0.5) * step                    ! Compute the position of the rectangle.
     sum = sum + 1.0/(1.0 + x * x)           ! Update the sum by adding the surface of the current rectangle.
   end do

   pi = 4.0 * sum * step                     ! Multiply by the factor: 4.0 * step
 
   call cpu_time(end_time)                   ! Get the end time.

   elapsed_time = end_time - start_time      ! Compute the elapsed time in seconds.

   ! Print out the results: pi value, number of steps, elapsed time

   write(*,fmt="(a,f15.12,a,I15,a,f15.12,a)") &
         & "The value of pi is [ ", pi, "; Computed using [ ", & 
         & nb_steps, "] steps in [ ", elapsed_time, "]  seconds"

end program compute_pi

! ==============================================================================
! End of the program Compute Pi.
! ==============================================================================
