program DRB16
	
	implicit none
	integer,dimension(100) :: a
	integer::i,j,x,len
	len=100
	x=10
	!$OMP PARALLEL DO private(j)	
	do i=0,len-1
		a(i)=x
		x=i
	end do
	!$OMP end PARALLEL do
	
        print '("x=",I0)',x	        
			
end program DRB16
