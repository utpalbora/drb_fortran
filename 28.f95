program DRB28

   implicit none
   integer :: i, tmp, len
   integer, dimension(0:99) :: a

   len = 100
   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL do
   do i = 0, len - 1
      tmp = a(i) + i
      a(i) = tmp
   end do
!$OMP         end PARALLEL do

   write (*, *) "a[50]=", a(50)
end program DRB28
