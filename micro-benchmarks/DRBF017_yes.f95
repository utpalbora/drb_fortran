!ALLOCATE - - > Array POINTER - - > No SCOP
program DRB17

   implicit none
   integer, dimension(0:99):: a
   integer::i, j, x, len, number
   CHARACTER(LEN=20) :: buffer

   len = 100

   x = 10
!$OMP         PARALLEL DO private(j)
   do i = 0, len - 1
      a(i) = x
      x = i
   end do
!$OMP         end PARALLEL do

   write (*, *) "x=", x, ",a[0]=", a(0)

end program DRB17
