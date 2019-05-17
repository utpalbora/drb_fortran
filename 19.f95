program DRB19

	implicit none
	integer::i,inLen,outLen,number
	integer,dimension(:),allocatable :: input
	integer,dimension(:),allocatable :: output
	
	CHARACTER(LEN=20) :: buffer
	
	inLen =1000
	outLen = 0
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		inLen = number
	end if


	allocate(input(inLen))
	allocate(output(inLen))

	do i=0,inLen-1
		input(i)=i
	end do

	!$OMP PARALLEL do	
	do i=0,inLen-1
		output(outLen) = input(i)
		outLen = outLen+1
	end do
	!$OMP end PARALLEL do
	
        print '("output[0]=",I0)',output(0)	        
			
end program DRB19
