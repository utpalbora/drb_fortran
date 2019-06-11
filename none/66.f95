subroutine setup(N)

   implicit none
   integer, intent(in)::N
   integer :: i
   real*4, dimension(0:N*16-1) ::m_pdv_sum, m_nvol

!$OMP         parallel do schedule(static)
   do i = 1, N
      m_pdv_sum(i) = 0.0
      m_nvol(i) = (i - 1)*2.5
   end do
!$OMP         end parallel do

end subroutine setup

program DB66

   implicit none
   integer :: N = 1000
   call setup(N)

end program DB66
