program DRB29

   implicit none
   integer :: i, len, number
   integer, dimension(0:99) :: a
   CHARACTER(LEN=20) :: buffer

   len = 100

   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL do
   do i = 0, len - 2
      a(i + 1) = a(i) + 1
   end do
!$OMP         end PARALLEL do

end program DRB29
