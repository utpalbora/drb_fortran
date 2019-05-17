program DRB18

	implicit none
	integer,dimension(1000) :: input
	integer,dimension(1000) :: output

	integer::i,inLen,outLen
	inLen = 1000
	outLen = 0

	do i=0,inLen-1
		input(i)=i
	end do

	!$OMP PARALLEL do	
	do i=0,inLen-1
		output(outLen) = input(i)
		outLen = outLen+1
	end do
	!$OMP end PARALLEL do
	
        print '("output[500]=",I0)',output(500)	        
			
end program DRB18
