subroutine foo
   implicit none
   integer::q = 0
   save ::q
   q = q + 1
end subroutine foo

program DB82

   implicit none
!$OMP         parallel
   call foo()
!$OMP         end parallel

end program DB82
