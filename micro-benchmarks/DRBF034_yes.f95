program DRB33

   implicit none
   integer::i, len, number
   integer, dimension(0:1999):: a
   CHARACTER(LEN=20) :: buffer

   len = 2000

   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL DO

   do i = 1, len/2 - 1
      a(2*i + 1) = a(i) + 1
   end do
!$OMP         end PARALLEL do

end program DRB33
