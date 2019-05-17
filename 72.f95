program DB72

   implicit none
   integer::i = 0

!$OMP         parallel
!$OMP         single
!$OMP                 task depend(out:i)
   i = 1
!$OMP                 end task
!$OMP                 task depend(in:i)
   i = 2
!$OMP                 end task
!$OMP         end single
!$OMP         end parallel

end program DB72
