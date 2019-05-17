program DB73

	integer :: i,j
	integer,dimension(0:99,0:99) :: a
	
	!$OMP parallel do 
		do i=0,99
			do j=0,99
				a(i,j) = a(i,j)+1
			end do
		end do
	!$OMP end parallel do
	
end program DB73
