program DB40

   implicit none
   integer::i, len, number
   integer, dimension(0:999) :: a
   CHARACTER(LEN=20) :: buffer

   len = 1000

   a(0) = 2

!$OMP         PARALLEL DO
   do i = 0, len - 1
      a(i) = a(i) + a(0)
   end do
!$OMP         end PARALLEL do

end program DB40
