program DB97

   implicit none
   integer::i, i2, len = 2560
   double precision :: sum = 0.0, sum2 = 0.0
   double precision, dimension(:), allocatable::a, b
   allocate (a(0:len - 1), b(0:len - 1))

   do i = 0, len - 1
      a(i) = real(i)/2.0
      b(i) = real(i)/3.0
   end do

!$OMP         target map(to: a(0:len-1), b(0:len-1)) map(tofrom: sum)
!$OMP         teams num_teams(10) thread_limit(256) reduction (+:sum)
!$OMP         distribute
   do i2 = 0, len - 1, 256
!$OMP                         parallel do reduction (+:sum)
      do i = i2, min(i2 + 256, len) - 1
         sum = sum + a(i)*b(i)
      end do
   end do
!$OMP         end distribute
!$OMP         end teams
!$OMP         end target

!$OMP         parallel do reduction(+:sum2)
   do i = 0, len - 1
      sum2 = sum2 + a(i)*b(i)
   end do
   print *, "sum=", sum, " sum2=", sum2
end program DB97
