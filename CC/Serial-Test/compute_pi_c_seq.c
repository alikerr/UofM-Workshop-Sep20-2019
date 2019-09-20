/*
 * ==============================================================================
 * Program to compute PI using numerical integration.
 * Compile with:
 *    gcc compute_pi_c_seq.c -o compute_pi_c_seq
 *    icc compute_pi_c_seq.c -o compute_pi_c_seq
 * ==============================================================================
*/

#include <stdio.h>
#include <math.h>
#include <time.h>

#define nb_steps 20000000                    /* Number of steps        */
#define step (1.0 / (double) nb_steps)       /* Width of the small rectangle */

double pi;
double start_time, end_time, elapsed_time;   /* Time variables to compute the cpu time used */

int main() {

  double x, sum;
  int i;

  start_time = clock();                      /* Get the start time */                         

  sum = 0.0;                                 /* Initialize the sum variable. */ 

  for (i = 0; i < nb_steps; i++) {           /* Loop over the number of steps. */
     x = (i + 0.5) * step;                   /* Compute the position of the rectangle. */
     sum += 1.0/(1.0 + x * x);               /* Update the sum by adding the surface of the current rectangle. */
  }

  pi = 4.0 * sum * step;                     /* Multiply by the factor: 4.0 * step */

  end_time = clock();                        /* Get the end time */

  /* Compute the elapsed time in seconds */
 
  elapsed_time = ((double) (end_time - start_time)) / CLOCKS_PER_SEC;

  /* Print out the results: pi value, number of steps, elapsed time */

  printf("The value of pi is [ %15.12lf ]; Computed using [ %ld ] steps in [ %15.12lf ]  seconds\n",pi,nb_steps,elapsed_time);

  return 0;

}

// End of the program Compute Pi.
