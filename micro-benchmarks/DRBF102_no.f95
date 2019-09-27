program DB102

   implicit none
   !INCLUDE "omp_lib.h"
   real::x
   integer :: y
   common/globalx/x
   common/globaly/y

!$OMP         threadprivate(/globalx/,/globaly/)
   x = 0.0
   y = 0

!$OMP         PARALLEL
!$OMP                 single
   x = 1.0
   y = 1
!$OMP                 end single copyprivate(x,y)
!$OMP         end parallel

   print *, "x=", x, " y=", y

end program DB102
