program DRB71
   implicit none

   integer :: i, len
   integer, dimension(:), allocatable :: a

   len = 1000
   allocate (a(0:len - 1))
   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         target map(a(0:len-1))
!$OMP         parallel do
   do i = 0, len - 1
      a(i) = a(i) + 1
   end do
!$OMP         end parallel do
!$OMP         end target

end program DRB71
