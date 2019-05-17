program DB114

   implicit none
   integer::i, len, x
   integer, dimension(0:99) :: a

   len = 100
   do i = 0, len - 1
      a(i) = i
   end do

   call srand(time())
   x = rand()
!$OMP         parallel do if(modulo(x,2)==1)
   do i = 0, len - 2
      a(i + 1) = a(i) + 1
   end do
!$OMP         end parallel do
   print '("a[50]=",I0)', a(50)

end program DB114
