program DB92

   implicit none
   integer :: i, sum = 0, sum0 = 0, sum1 = 0
!$OMP         parallel
!$OMP                 do
   do i = 1, 1000
      sum0 = sum0 + i
   end do
!$OMP                 end do
!$OMP                 critical
   sum = sum + sum0
!$OMP                 end critical
!$OMP         end parallel
   do i = 1, 1000
      sum1 = sum1 + i
   end do

   print *, "sum=", sum, ";", " sum1=", sum1

end program DB92
