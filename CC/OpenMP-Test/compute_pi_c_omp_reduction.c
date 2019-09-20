/*
 * ==============================================================================
 * Simple Program to Compute PI: OpenMP Version.
 * Compile with:
 *    gcc -fopenmp compute_pi_c_omp_reduction.c -o compute_pi_c_omp_reduction
 *    icc -openmp compute_pi_c_omp_reduction.c -o compute_pi_c_omp_reduction
 * ==============================================================================
*/

#include <omp.h>
#include <stdio.h>
#include <math.h>
#include <time.h>

#define nb_steps 20000000                    /* Number of steps        */
#define step (1.0 / (double) nb_steps)       /* Width of the small rectangle */
#define MAX_THREADS 4

double pi;

int main() {
  double start_time, end_time, elapsed_time;   /* Time variables to compute the cpu time used */
  double pi;
  int i, j;
  double x, partial_sum;
  double total_sum; 
  
  for (j = 1; j <= MAX_THREADS; j++) {

      total_sum = 0.0;

      omp_set_num_threads(j);

      start_time = omp_get_wtime();                      /* Get the time at the start of parallel region */

      #pragma omp parallel
      {
        int numthreads = omp_get_num_threads();

        #pragma omp single
           printf("The Number of Threads = %d \n", numthreads);

        #pragma omp for reduction(+:total_sum) 	
           for (i = 1; i < nb_steps; i++) {                 /* Loop over the number of steps. */
                x = (i + 0.5) * step;                       /* Compute the position of the rectangle. */
                total_sum = total_sum + 1.0/(1.0 + x * x);  /* Update the sum by adding the surface of the current rectangle. */
           }
      }

      pi = 4.0 * total_sum * step;                     /* Multiply by the factor: 4.0 * step */

      end_time = omp_get_wtime();                      /* Get the time at the end of parallel region */

      /* Compute the elapsed time in seconds */

      elapsed_time = ((double)(end_time - start_time)); 

      /* Print out the results: pi value, number of steps, elapsed time */

      printf("The value of pi is [ %15.12lf ]; Computed using [ %ld ] steps in [ %15.12lf ] seconds\n",pi,nb_steps,elapsed_time);

  }

}

// End of the program Compute Pi.
