program DRB70
   implicit none

   integer :: i
   integer, dimension(0:99) :: a, b, c

!$OMP         simd
   do i = 0, 99
      a(i) = b(i)*c(i)
   end do
!$OMP         end simd

end program DRB70
