program DRB115
   implicit none

   integer :: i, len
   integer, dimension(0:99) :: a, b

   len = 100
   do i = 0, len - 1
      a(i) = i
      b(i) = i + 1
   end do

!$OMP         parallel do simd
   do i = 0, len - 2
      a(i + 1) = a(i) + b(i)
   end do
!$OMP         end parallel do simd

   print '("a[50]=",I0)', a(50)

end program DRB115
