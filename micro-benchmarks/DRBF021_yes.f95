program DRB21

   implicit none
   integer :: i, j
   real :: temp, sum
   integer,parameter :: len=100
   real, dimension(0:99, 0:99) :: u

   sum = 0.0

   do i = 0, len-1
      do j = 0, len-1
         u(i, j) = 0.5
      end do
   end do

!$OMP         PARALLEL DO private(temp,i,j)
   do i = 0, len-1
      do j = 0, len-1
         temp = u(i, j)
         sum = sum + temp*temp
      end do
   end do
!$OMP         end PARALLEL do

   print *, "sum=", sum

end program DRB21
