!ALLOCATE - - > Array POINTER - - > No SCOP
program DB1
   implicit none
   integer::i, len, number
   integer, dimension(0:999) :: a
   CHARACTER(LEN=20) :: buffer

   len = 1000

   buffer = ""
   CALL GET_COMMAND_ARGUMENT(1, buffer)
   read (buffer, '(I10)') number

   if (COMMAND_ARGUMENT_COUNT() > 0) then
      len = number
   end if

   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL DO

   do i = 0, len - 2
      a(i) = a(i + 1) + 1
   end do

!$OMP         end PARALLEL do
   print '("a[999]=",I0)', a(999)

end program DB1
