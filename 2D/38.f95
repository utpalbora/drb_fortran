program DRB38

   implicit none
   integer::i, j, n, m, len, number
   double precision, dimension(0:999, 0:999):: b

   len = 1000

   n = len
   m = len

   do i = 0, n - 1
!$OMP         PARALLEL DO
      do j = 1, m - 1
         b(i, j) = b(i, j - 1)
      end do
!$OMP         end PARALLEL do
   end do

end program DRB38
