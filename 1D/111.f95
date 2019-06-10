program DB111

   implicit none
   integer::i, j, len
   double precision, dimension(0:99) :: a, b, c

   len = 100
   i = 0
   j = 0

   do i = 0, len - 1
      a(i) = real(i)/2.0
      b(i) = real(i)/3.0
      c(i) = real(i)/7.0
   end do

!$OMP         parallel do
   do i = 0, len - 1
      c(j) = c(j) + a(i)*b(i)
      j = j + 1
   end do
!$OMP         end parallel do

   print *, "c[50]=", c(50)

end program DB111
