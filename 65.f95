program DB65

   implicit none
   double precision::pi, x, interval_width
   integer(kind=8) :: i
   interval_width = (1.0)/2000000000

!$OMP         parallel do reduction(+:pi) private(x)
   do i = 0, 1999999999
      x = (i + 0.5)*interval_width
      pi = pi + (1.0)/(x*x + 1.0)
   end do
!$OMP         end parallel do

   pi = pi*4.0*interval_width
   print *, "PI=", pi

end program DB65
