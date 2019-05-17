
program DB103

	implicit none
	INCLUDE "omp_lib.h"
	integer::k
	
        !$OMP PARALLEL 
                !$OMP master	
			k= OMP_GET_NUM_THREADS()
			print *,"Number of Threads requested = ",k
                !$OMP end master        
        !$omp end parallel
        	
end program DB103
