program DRB54

   implicit none
   integer::i, j, n, m
   double precision, dimension(0:99, 0:99) :: b

   n = 100
   m = 100

   do i = 0, n - 1
      do j = 0, m - 1
         b(i, j) = real(i*j)
      end do
   end do

   do i = 1, n - 1
!$OMP                 PARALLEL DO
      do j = 1, m - 1
         b(i, j) = b(i - 1, j - 1)
      end do
!$OMP                 end PARALLEL do
   end do

end program DRB54
