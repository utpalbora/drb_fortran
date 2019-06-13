program DRB32

   implicit none
   integer::i, j, n, m, number, len
   double precision, dimension(0:999, 0:999) :: b
   len = 1000

   n = len
   m = len
   do i = 0, n - 1
      do j = 0, m - 1
         b(i, j) = 0.5
      end do
   end do

!$OMP         PARALLEL DO private(j)

   do i = 1, n - 1
      do j = 1, m - 1
         b(i, j) = b(i - 1, j - 1)
      end do
   end do
!$OMP         end PARALLEL do

end program DRB32
