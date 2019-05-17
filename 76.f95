subroutine f1(q)
   implicit none
   integer, intent(out)::q
   q = 1
end subroutine f1

program DB76

   implicit none
   integer::i = 0, sum = 0
!$OMP         parallel reduction(+:sum) num_threads(10) private(i)
   call f1(i)
   sum = sum + i
!$OMP         end parallel

   print *, "sum=", sum

end program DB76
