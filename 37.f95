program DRB37

   implicit none
   integer::i, j, n, m
   double precision, dimension(0:999, 0:999) :: b

   do i = 0, n - 1
!$OMP         PARALLEL DO
      do j = 1, m - 1
         b(i, j) = b(i, j - 1)
      end do
!$OMP         end PARALLEL do
   end do

   print *, "b[500][500]=", b(500, 500)

end program DRB37
