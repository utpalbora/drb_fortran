program DRB33

   implicit none
   integer::i, len, number
   integer, dimension(:), allocatable :: a
   CHARACTER(LEN=20) :: buffer

   len = 2000

   buffer = ""
   CALL GET_COMMAND_ARGUMENT(1, buffer)
   read (buffer, '(I10)') number

   if (COMMAND_ARGUMENT_COUNT() > 0) then
      len = number
   end if

   allocate (a(0:len - 1))

   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         PARALLEL DO

   do i = 1, len/2 - 1
      a(2*i + 1) = a(i) + 1
   end do
!$OMP         end PARALLEL do

end program DRB33
