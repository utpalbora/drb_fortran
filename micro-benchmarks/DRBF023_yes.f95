program DRB23

   implicit none
   integer :: i
   i = 0

!$OMP         sections
!$OMP                 section
   i = 1
!$OMP                 section
   i = 2
!$OMP         end sections

   print *, "i=", i

end program DRB23
