program DB1
   implicit none
   integer::i, len, number
   integer, dimension(0:999) :: a
   len = 1000

   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL DO
   do i = 0, len - 2
      a(i) = a(i + 1) + 1
   end do
!$OMP         end PARALLEL do
   
   print '("a[999]=",I0)', a(999)
end program DB1
