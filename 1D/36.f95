program DRB36

   implicit none
   integer :: i, tmp, len, number
   integer, dimension(:), allocatable :: a

   CHARACTER(LEN=20) :: buffer

   tmp = 10
   len = 100

   buffer = ""
   CALL GET_COMMAND_ARGUMENT(1, buffer)
   read (buffer, '(I10)') number

   if (COMMAND_ARGUMENT_COUNT() > 0) then
      len = number
   end if

   allocate (a(0:len - 1))

!$OMP         PARALLEL do
   do i = 0, len - 1
      a(i) = tmp
      tmp = a(i) + i
   end do
!$OMP         end PARALLEL do

end program DRB36
