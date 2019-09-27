subroutine initialise()
   implicit none   
   integer, parameter ::  MSIZE = 200
   !double precision, parameter :: alpha = 0.0543
   integer :: n, m, i, j, xx, yy
   double precision, dimension(0:MSIZE-1,0:MSIZE-1) :: u, f
   !double precision :: dx, dy

   n=MSIZE
   m=MSIZE
   !dx=2.0 / (n - 1)
   !dy=2.0 / (m - 1)

!$OMP         PARALLEL DO private(i,j,xx,yy,n,m)
   do i = 1, n - 1
      do j = 0, m - 1
        !xx = INT(-1.0 + dx * (i - 1))
        !yy = INT(-1.0 + dy * (j - 1))
        xx = 10
        yy = 20
        u(i,j) = 0.0
        f(i,j) = -1.0 * 0.0543 * (1.0 - xx * xx) * (1.0 - yy * yy) - 2.0 * (1.0 - xx * xx) - 2.0 * (1.0 - yy * yy)
      end do
   end do
!$OMP         end PARALLEL do
 print *, "u[100][100]=", u(100,100)




end subroutine initialise



program DRB57

   implicit none
   call initialise()

end program DRB57

