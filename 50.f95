subroutine foo1(o1, c, len)

   implicit none
   integer::i
   integer, intent(in)::len
   double precision::volnew_o8
   double precision, dimension(0:len - 1), intent(out)::o1
   double precision, dimension(0:len - 1), intent(out)::c
!$OMP         parallel do
   do i = 0, len - 1
      volnew_o8 = 0.5*c(i)
      o1(i) = volnew_o8
   end do
!$OMP         end parallel do

end subroutine foo1

program DB50

   implicit none
   double precision, dimension(0:99)::o1
   double precision, dimension(0:99)::c
   call foo1(o1, c, 100)

end program DB50
