program DB99

   implicit none
   integer::i, j, len = 100
   double precision, dimension(:, :), allocatable::a, b, c
   allocate (a(0:len - 1, 0:len - 1), b(0:len - 1, 0:len - 1), c(0:len - 1, 0:len - 1))

   do i = 0, len - 1
      do j = 0, len - 1
         a(i, j) = real(i)/2.0
         b(i, j) = real(i)/3.0
         c(i, j) = real(i)/7.0
      end do
   end do

!$OMP         simd collapse(2)
   do i = 0, len - 1
      do j = 0, len - 1
         c(i, j) = a(i, j)*b(i, j)
      end do
   end do
!$OMP         end simd

   print *, "c[50][50]=", c(50, 50)
end program DB99
