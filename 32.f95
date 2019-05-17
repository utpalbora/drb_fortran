program DRB32

	implicit none
	integer::i,j,n,m,number,len
	double precision,dimension(:,:),allocatable :: b
	CHARACTER(LEN=20) :: buffer
	
	len = 1000
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if
	
	allocate(b(0:len-1,0:len-1))
	
	n=len
	m=len
	do i=0, n-1
		do j=0, m-1
			b(i,j) =0.5
		end do
	end do

	!$OMP PARALLEL DO private(j)
	
	do i=1, n-1
		do j=1, m-1
			b(i,j) = b(i-1,j-1)
		end do
	end do	
	!$OMP end PARALLEL do	
	

end program DRB32
