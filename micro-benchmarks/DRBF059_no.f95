subroutine foo
   implicit none
   integer::i, x
!$OMP         parallel do private(i) lastprivate(x)
   do i = 0, 99
      x = i
   end do
!$OMP         end parallel do
   print *, "x=", x
end subroutine foo

program DB59
   implicit none
   call foo()
end program DB59
