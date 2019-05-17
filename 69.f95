program DB69

   implicit none
   include "omp_lib.h"
   integer(kind=OMP_LOCK_KIND) :: lck
   integer :: i = 0
   call omp_init_lock(lck)

end program DB69
