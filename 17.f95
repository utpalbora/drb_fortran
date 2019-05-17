program DRB17

	implicit none
	integer,dimension(:),allocatable :: a
	integer::i,j,x,len,number
	CHARACTER(LEN=20) :: buffer
	
	len =100
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if


	allocate(a(len))
	
	x=10
	!$OMP PARALLEL DO private(j)	
	do i=0,len-1
		a(i)=x
		x=i
	end do
	!$OMP end PARALLEL do
	
        write(*,*)"x=",x,",a[0]=",a(0)	        
			
end program DRB17
