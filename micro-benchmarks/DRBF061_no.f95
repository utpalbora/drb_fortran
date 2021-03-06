subroutine mv
   implicit none
   integer :: i, j
   double precision, dimension(0:999, 0:999)::a
   double precision, dimension(0:999)::v, v_out
   real :: sum

!$OMP         parallel do private(i,j)
   do i = 0, 999
      sum = 0.0
      do j = 0, 999
         sum = sum + a(i, j)*v(j)
      end do
      v_out(i) = sum
   end do
!$OMP         end parallel do

end subroutine mv

program DB61

   implicit none
   call mv()

end program DB61
