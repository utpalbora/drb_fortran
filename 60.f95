subroutine mmm
   implicit none
   integer::i, j, k
   double precision, dimension(0:99, 0:99)::a, b, c
!$OMP         parallel do private(j,k)
   do i = 0, 99
      do j = 0, 99
         do k = 0, 99
            c(i, j) = c(i, j) + a(i, k)*b(k, j)
         end do
      end do
   end do
!$OMP         end parallel do

end subroutine mmm

program DB60

   implicit none
   call mmm()
end program DB60
