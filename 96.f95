program DB96

   integer :: i, j
   integer, dimension(0:99, 0:99) :: a

!$OMP         parallel
!$OMP                 single
!$OMP                         taskloop collapse(2)
   do i = 0, 99
      do j = 0, 99
         a(i, j) = a(i, j) + 1
      end do
   end do
!$OMP                 end single
!$OMP         end parallel

   print *, "a[50][50]=", a(50, 50)

end program DB96
