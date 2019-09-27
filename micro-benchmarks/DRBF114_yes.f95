program DB114
   implicit none
   integer*4 time
   integer::i, len, x
   real :: n
   integer, dimension(0:99) :: a

   len = 100
   do i = 0, len - 1
      a(i) = i
   end do
   call random_seed()
   call random_number(n)
   x = int(n)
!$OMP         parallel do if(modulo(x,2)==1)
   do i = 0, len - 2
      a(i + 1) = a(i) + 1
   end do
!$OMP         end parallel do
   print '("a[50]=",I0)', a(50)

end program DB114
