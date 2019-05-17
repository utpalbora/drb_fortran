program DB1
	
	implicit none
	integer::i,len,number
	integer,dimension(:),allocatable :: a
	CHARACTER(LEN=20) :: buffer
	
	len =1000
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if
	

	allocate(a(len))
        do i=0, len-1
                a(i) = i
        end do
        
        !$OMP PARALLEL DO
        
        do i=0, len-2
        	a(i)=a(i+1)+1
        end do
        !$OMP end PARALLEL do 
        print '("a[500]=",I0)',a(500)
         
end program DB1
