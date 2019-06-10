subroutine setup(N)

   implicit none
   integer, intent(in)::N
   integer :: i
   double precision :: d
   real*16 ::m_pdv_sum(*)
   real*16 ::m_nvol(*)
   pointer(x, m_pdv_sum)
   pointer(y, m_nvol)

   x = malloc(N*16)
   y = malloc(N*16)

!$OMP         parallel do schedule(static)
   do i = 1, N
      m_pdv_sum(i) = 0.0
      m_nvol(i) = (i - 1)*2.5
   end do
!$OMP         end parallel do

   call free(x)
   call free(y)
end subroutine setup

program DB66

   implicit none
   integer :: N = 1000
   call setup(N)

end program DB66
