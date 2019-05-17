program DB10

	implicit none
	integer::i,x,len,number
	CHARACTER(LEN=20) :: buffer
	
	len = 10000
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if
		
	!$OMP PARALLEL DO private(i)
	do i=0,len-1
		x=i
	end do
        !$OMP end PARALLEL do
        print '("x=",I0)',x	
		
end program DB10
