program DRB29

   implicit none
   integer :: i, len
   integer, dimension(0:99) :: a

   len = 100
   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL do
   do i = 0, len - 2
      a(i + 1) = a(i) + 1
   end do
!$OMP         end PARALLEL do

   write (*, *) "a[50]=", a(50)
end program DRB29
