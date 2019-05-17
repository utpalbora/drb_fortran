program DB110
	
	implicit none
	
	integer::x,i
	
	x=0
	!$OMP parallel do ordered
	do i=0,99
		!$OMP ordered
		x=x+1
		!$OMP end ordered
	end do
	!$OMP end parallel do
	
	print *,"x=",x
		
end program DB110
