program DRB90

   implicit none
   integer :: i, len = 100, tmp, tmp2
   save ::tmp
   integer, dimension(:), allocatable :: a, b

   allocate (a(0:len - 1), b(0:len - 1))

   do i = 0, len - 1
      a(i) = i
      b(i) = i
   end do

!$OMP         parallel
!$OMP                 do
   do i = 0, len - 1
      tmp = a(i) + i
      a(i) = tmp
   end do
!$OMP                 end do
!$OMP         end parallel

!$OMP         parallel
!$OMP                 do
   do i = 0, len - 1
      tmp2 = b(i) + i
      b(i) = tmp2
   end do
!$OMP                 end do
!$OMP         end parallel

   write (*, *) "a[50]=", a(50), " b[50]=", b(50)
end program DRB90
