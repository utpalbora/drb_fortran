
program DB106

   implicit none
   integer::res, input
   input = 10
   res = 0
!$OMP         parallel
!$OMP                 single
   res = fib(input)
!$OMP                 end single
!$OMP         end parallel

   print *, "Fib(", input, ")=", res, " (correct answer should be 55)"

contains

   recursive function fib(n) result(res)
      implicit none
      integer::i, j
      integer, intent(in)::n
      integer::res

      if (n < 2) then
         res = n
      else
!$OMP                 task shared(i)
         i = fib(n - 1)
!$OMP                 end task
!$OMP                 task shared(j)
         j = fib(n - 2)
!$OMP                 end task
         res = i + j
!$OMP                 taskwait

      end if

   end function fib
end program DB106
