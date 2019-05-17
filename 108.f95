program DB108

   implicit none
   integer::a
   a = 0
!$OMP         parallel
!$OMP                 atomic
   a = a + 1
!$OMP                 end atomic
!$OMP         end parallel

   print *, "a=", a
end program DB108
