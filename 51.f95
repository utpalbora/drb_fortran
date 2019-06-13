program DB51

   implicit none
   include "omp_lib.h"
   integer::numThreads = 0

!$OMP         parallel
   if (omp_get_thread_num() == 0) then
      numThreads = omp_get_num_threads()
   end if
!$OMP         end parallel
   print *, "numThreads=", numThreads

end program DB51
