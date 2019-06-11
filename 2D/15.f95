program DRB15
   implicit none
   integer::i, j, n, m, len, number
   double precision, dimension(0:99, 0:99):: b
   len = 100
   n = len
   m = len

!$OMP         PARALLEL DO private(j)
   do i = 1, n - 1
      do j = 0, m - 1
         b(i, j) = b(i, j - 1)
      end do
   end do
!$OMP         end PARALLEL do

end program DRB15
