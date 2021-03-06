program DRB31

   implicit none
   integer::i, j, n, m
   double precision, dimension(0:999, 0:999) :: b

   n = 1000
   m = 1000
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

   print *, "b[500][500]=", b(500, 500)

end program DRB31
