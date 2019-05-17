program DRB35

   implicit none
   integer :: i, tmp, len
   integer, dimension(0:99) :: a
   tmp = 10
   len = 100

!$OMP         PARALLEL do
   do i = 0, len - 1
      a(i) = tmp
      tmp = a(i) + i
   end do
!$OMP         end PARALLEL do

   write (*, *) "a[50]=", a(50)
end program DRB35
