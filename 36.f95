program DRB36

   implicit none
   integer :: i, tmp, len, number
   integer, dimension(0:99):: a

   CHARACTER(LEN=20) :: buffer

   tmp = 10
   len = 100


!$OMP         PARALLEL do
   do i = 0, len - 1
      a(i) = tmp
      tmp = a(i) + i
   end do
!$OMP         end PARALLEL do

end program DRB36
