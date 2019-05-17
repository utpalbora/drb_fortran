program DB4
	
	implicit none
	integer::i,j,len,number
	double precision,dimension(:,:),allocatable :: a
	CHARACTER(LEN=20) :: buffer
	
	len = 20
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if
	
	allocate(a(len,len))
	
	do i=0, len-1
		do j=0, len-1
			a(i,j) =0.5
		end do
	end do

	!$OMP PARALLEL DO private(j)
	
	do i=0, len-2
		do j=0, len-1
			a(i,j) = a(i+1,j)+a(i,j)
		end do
	end do		
	!$OMP end PARALLEL do
	
end program DB4	
