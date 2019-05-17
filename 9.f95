program DB9

	implicit none
	integer:: i,x,len
	
	len =10000
	
	!$OMP PARALLEL DO private(i)	

	do i=0,len-1
		x=i
	end do
        !$OMP end PARALLEL do
        print '("x=",I0)',x	
        
end program DB9
