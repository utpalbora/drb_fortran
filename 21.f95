program DRB21

   implicit none
   integer :: i, j
   real :: temp, sum
   integer :: len
   real, dimension(:, :), allocatable :: u

   sum = 0.0
   len = 100
   allocate (u(100, 100))

   do i = 1, len
      do j = 1, len
         u(i, j) = 0.5
      end do
   end do

!$OMP         PARALLEL DO private(temp,i,j)
   do i = 1, len
      do j = 1, len
         temp = u(i, j)
         sum = sum + temp*temp
      end do
   end do
!$OMP         end PARALLEL do

   print *, "sum=", sum

end program DRB21
