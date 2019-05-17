subroutine f1(q)
   implicit none
   integer, intent(out)::q
!$OMP         critical
   q = 1
!$OMP         end critical
!$OMP         flush

end subroutine f1

program DB74

   implicit none
   integer::i = 0, sum = 0
!$OMP         parallel reduction(+:sum) num_threads(10)
   call f1(i)
   sum = sum + i
!$OMP         end parallel
   print *, "sum=", sum

end program DB74
