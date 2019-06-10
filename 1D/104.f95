program DB104

   implicit none
   integer :: i, error, len, b
   integer, dimension(:), allocatable :: a
   len = 1000
   allocate (a(0:len - 1))
   b = 5

   do i = 0, len - 1
      a(i) = i
   end do

!$OMP         parallel shared(b,error)
!$OMP                 do
   do i = 0, len - 1
      a(i) = b + a(i)*5
   end do
!$OMP                 end do nowait

!$OMP                 barrier

!$OMP                 single
   error = a(9) + 1
!$OMP                 end single
!$OMP         end parallel

   print *, "error = ", error
end program DB104
