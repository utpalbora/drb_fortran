program DRB27

   implicit none
   integer :: i
   i = 0

!$OMP         parallel
!$OMP                 single
!$OMP                         task
   i = 1
!$OMP                         end task
!$OMP                         task
   i = 2
!$OMP                         end task
!$OMP                 end single
!$OMP         end parallel

   print *, "i=", i

end program DRB27
