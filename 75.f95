program DB75

   implicit none
   include "omp_lib.h"
   integer::numThreads = 0

!$OMP         parallel
   if (omp_get_thread_num() == 0) then
      numThreads = omp_get_num_threads()
   else
      print *, "numThreads=", numThreads
   end if

!$OMP         end parallel

end program DB75
