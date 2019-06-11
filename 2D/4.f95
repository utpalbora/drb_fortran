program DB4

   implicit none
   integer::i, j, len, number
   double precision, dimension(0:19, 0:19) :: a

   len = 20

   do i = 0, len - 1
      do j = 0, len - 1
         a(i, j) = 0.5
      end do
   end do

!$OMP         PARALLEL DO private(j)

   do i = 0, len - 2
      do j = 0, len - 1
         a(i, j) = a(i + 1, j) + a(i, j)
      end do
   end do
!$OMP         end PARALLEL do

end program DB4
