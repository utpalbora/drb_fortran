program DRB15

	implicit none 
	integer::i,j,n,m,len,number
	double precision,dimension(:,:), allocatable:: b
	CHARACTER(LEN=20) :: buffer
	
	len =100
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if
	n=len
	m=len
	allocate(b(n,m))

	!$OMP PARALLEL DO private(j)	
	do i=1,n-1
		do j=0,m-1
			b(i,j)=b(i,j-1)
		end do
	end do
	!$OMP end PARALLEL do
	
	print *,"b[50][50]=",b(50,50)	
			
end program DRB15
