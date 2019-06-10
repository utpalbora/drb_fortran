program DB89

   implicit none
   integer, pointer::counter
   integer, target::i
   counter => i
   counter = 0
!$OMP          parallel
   counter = counter + 1
!$OMP          end parallel

   print *, "", counter

end program DB89
