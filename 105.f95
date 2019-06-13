
program DB105

   implicit none
   integer::res, input
   input = 30
   res = 0
!$OMP         parallel
!$OMP                 single
   res = fib(input)
!$OMP                 end single
!$OMP         end parallel

   print *, "Fib(", input, ")=", res

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
!$OMP                 taskwait
         res = i + j

      end if

   end function fib
end program DB105
