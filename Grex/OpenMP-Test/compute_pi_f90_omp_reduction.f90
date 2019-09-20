! ==============================================================================
! Simple Program to Compute PI: OpenMP Version.
! Compile with:
!    gfortran -fopenmp compute_pi_f90_omp_reduction.c -o compute_pi_f90_omp_reduction
!    ifort -openmp compute_pi_f90_omp_reduction.c -o compute_pi_f90_omp_reduction
! ==============================================================================

program compute_pi

   use omp_lib

   implicit none
   integer, parameter :: nb_steps = 200000000         ! Number of steps.
   real(8), parameter :: step     = 1.0d0 / nb_steps ! Width of the small rectangle.
   real(8) :: pi, x
   real(8) :: start_time, end_time, elapsed_time     ! Time variables to compute the cpu time used.
   integer :: i, j
   real(8) :: total_sum, partial_sum
   integer :: numthreads, id

   integer, parameter :: MAX_THREADS = 4

   do j = 1, MAX_THREADS

      call omp_set_num_threads(j)

      total_sum  = 0.0d0                               ! Initialize the sum variable.  

      start_time = omp_get_wtime()                     ! Get the start time.

!$omp parallel private(id) shared(numthreads,x,total_sum) 

      numthreads = omp_get_num_threads()

!$omp single
      write(*,fmt="(a,I2)") "The Number of Threads = ", numthreads
!$omp end single

!$omp do reduction(+:total_sum)      
      do i = 1, nb_steps                             ! Loop over the number of steps. 
         x = (i + 0.5) * step                        ! Compute the position of the rectangle.
         total_sum = total_sum  + 1.0/(1.0 + x * x)  ! Update the sum by adding the surface of the current rectangle.
      end do
!$omp end do

!$omp end parallel

      end_time = omp_get_wtime()               ! Get the end time.

      pi = 4.0 * total_sum * step                     ! Multiply by the factor: 4.0 * step
 
      elapsed_time = end_time - start_time      ! Compute the elapsed time in seconds.

      ! Print out the results: pi value, number of steps, elapsed time

      write(*,fmt="(a,f15.12,a,I15,a,f15.12,a)") &
            & "The value of pi is [ ", pi, "; Computed using [ ", nb_steps, &
            & "] steps in [ ", elapsed_time, "]  seconds"

   end do

end program compute_pi

! ==============================================================================
! End of the program Compute Pi.
! ==============================================================================
