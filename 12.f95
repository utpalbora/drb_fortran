ALLOCATE --> Array POINTER --> No SCOP
program DB12

	implicit none
	integer::i,len,number,numNodes,numNodes2
	integer,dimension(0:99)::x	
	CHARACTER(LEN=20) :: buffer
	
	len = 100
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if	
	
	numNodes=len
	numNodes2=0
	
	do i=0,len-1
	
		if (modulo(i,2)==0) then
			x(i)=5
		else
			x(i)=-5
		end if	
	end do
	
        !$OMP PARALLEL DO
        
        do i=numNodes-1,0,-1
        	if (x(i) <=0) then
        		numNodes2 = numNodes2-1
        	end if
        end do	
        !$OMP end PARALLEL do	


end program DB12
