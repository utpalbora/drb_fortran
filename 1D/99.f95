subroutine foo(a, b, N)
   implicit none
   integer::i
   integer, intent(in) :: N
   double precision, dimension(0:N - 1), intent(out)::a, b

   do i = 0, N - 1
      b(i) = a(i)*real(i)
   end do

end subroutine foo

program DB99

   implicit none
   integer::i, len
   double precision, dimension(:), allocatable::a, b
   len = 1000
   allocate (a(0:len - 1), b(0:len - 1))
   do i = 0, len - 1
      a(i) = real(i)/2.0
      b(i) = 0.0
   end do

   call foo(a, b, len)

   print *, "b[50]=", b(50)
end program DB99
