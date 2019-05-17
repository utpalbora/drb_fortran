program DB94

	integer :: i,j
	integer,dimension(0:99,0:99) :: a
	
	!$OMP parallel do ordered(2)
		do i=0,99
			do j=0,99
				a(i,j) = a(i,j)+1
				!$OMP ordered depend(sink:i-1,j) depend(sink:i,j-1)
				print *,"test i=",i," j=",j
				!$OMP ordered depend(source)
			end do
		end do
			
	!$OMP end parallel do
	

	
end program DB94
