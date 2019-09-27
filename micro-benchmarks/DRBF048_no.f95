subroutine foo(a, n, g)
   implicit none
   integer, dimension(0:n - 1), intent(inout)::a
   integer, intent(in)::n, g
   integer :: i

!$OMP         PARALLEL DO firstprivate(g)
   do i = 0, n - 1
      a(i) = a(i) + g
   end do
!$OMP         end PARALLEL DO

end subroutine foo

program DB48
   implicit none
   integer, dimension(0:99) :: a
   call foo(a, 100, 7)

end program DB48
