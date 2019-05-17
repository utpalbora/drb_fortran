program DB109
	
	implicit none
	
	integer::x,i
	x=0
	!$OMP parallel do ordered
	do i=0,99
		x=x+1
	end do
	!$OMP end parallel do
	
	print *,"x=",x
		
end program DB109
