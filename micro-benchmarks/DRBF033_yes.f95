program DRB33

   implicit none
   integer::i
   integer, dimension(0:1999) :: a

   do i = 0, 1999
      a(i) = i
   end do

!$OMP         PARALLEL DO

   do i = 0, 999
      a(2*i + 1) = a(i) + 1
   end do
!$OMP         end PARALLEL do

   print *, "a[1001]=", a(1001)

end program DRB33
