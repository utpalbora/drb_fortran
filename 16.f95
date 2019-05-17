program DRB16

   implicit none
   integer, dimension(0:99) :: a
   integer::i, x, len
   len = 100
   x = 10
!$OMP         PARALLEL DO
   do i = 0, len - 1
      a(i) = x
      x = i
   end do
!$OMP         end PARALLEL do

   print '("x=",I0)', x

end program DRB16
