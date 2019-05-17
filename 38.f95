program DRB38

   implicit none
   integer::i, j, n, m, len, number
   double precision, dimension(:, :), allocatable :: b
   CHARACTER(LEN=20) :: buffer

   len = 1000
   buffer = ""
   CALL GET_COMMAND_ARGUMENT(1, buffer)
   read (buffer, '(I10)') number

   if (COMMAND_ARGUMENT_COUNT() > 0) then
      len = number
   end if

   n = len
   m = len
   allocate (b(0:n - 1, 0:m - 1))

   do i = 0, n - 1
!$OMP         PARALLEL DO
      do j = 1, m - 1
         b(i, j) = b(i, j - 1)
      end do
!$OMP         end PARALLEL do
   end do

end program DRB38
