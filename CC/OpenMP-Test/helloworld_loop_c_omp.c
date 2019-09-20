/*
 * ==============================================================================
 * Simple Hello World program: OpenMP Version.
 * Compile with:
 *    gcc -fopenmp helloworld_loop_c_omp.c helloworld_loop_c_omp
 *    icc -openmp helloworld_loop_c_omp.c helloworld_loop_c_omp
 * ==============================================================================
*/

#include <stdio.h>
#include <omp.h>     /* Add the Header to enable OpenMP Runtime Library */

#define nloops 8
 
int main() {

  int ID, nthreads;

  #pragma omp parallel default(none) private(ID) shared(nthreads)
  {
     int i; 
     ID = omp_get_thread_num();

     /* Let us store the variable nthreads. Pick one thread to store it (ID = 0) */

     if (ID == 0) { nthreads = omp_get_num_threads(); }
   
     /* Here, we replace the previous line by a single construct. */
 
     #pragma omp single
        nthreads = omp_get_num_threads();
 
     #pragma omp for
     for (i = 0; i < nloops; i++) { 
          printf("Hello World!; My ID is equal to [ %d of %d ] - I get the value [ %d ]\n",ID,nthreads,i);
     }
  }

    printf("The number of threads is: %d\n",nthreads);

}

/*
 * ==============================================================================
 * End of the program Hello World.
 * ==============================================================================
*/
