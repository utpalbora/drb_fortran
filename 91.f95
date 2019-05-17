program DB92

   implicit none
   integer :: i, sum = 0, len = 1000
   integer :: sum0 = 0, sum1 = 0

!$OMP         threadprivate(sum0)
!$OMP         parallel copyin(sum0)
!$OMP                 do
   do i = 0, len - 1
      sum0 = sum0 + i
   end do
!$OMP                 end do
!$OMP                 critical
   sum = sum + sum0
!$OMP                 end critical
!$OMP         end parallel
   do i = 0, len - 1
      sum1 = sum1 + i
   end do

   print *, "sum=", sum, ";", " sum1=", sum1

end program DB92
