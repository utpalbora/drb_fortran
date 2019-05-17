program DB40

   implicit none
   integer::i, len, number
   integer, dimension(:), allocatable :: a
   CHARACTER(LEN=20) :: buffer

   len = 1000

   buffer = ""
   CALL GET_COMMAND_ARGUMENT(1, buffer)
   read (buffer, '(I10)') number

   if (COMMAND_ARGUMENT_COUNT() > 0) then
      len = number
   end if

   allocate (a(0:len - 1))
   a(0) = 2

!$OMP         PARALLEL DO
   do i = 0, len - 1
      a(i) = a(i) + a(0)
   end do
!$OMP         end PARALLEL do

end program DB40
