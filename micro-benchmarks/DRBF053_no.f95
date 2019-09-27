program DB53

   integer::i, j
   double precision, dimension(0:20, 0:20)::a

   do i = 0, 18
!$OMP         PARALLEL DO
      do j = 0, 19
         a(i, j) = a(i, j) + a(i + 1, j)
      end do
!$OMP         end PARALLEL DO
   end do

end program DB53
