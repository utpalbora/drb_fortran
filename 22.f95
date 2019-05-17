program DRB22

	implicit none
	integer :: i,j
	real :: temp,sum
	integer :: len,number
	real,dimension(:,:),allocatable :: u	
	CHARACTER(LEN=20) :: buffer

	sum = 0.0
	len=100
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if


	allocate(u(100,100))

	do i=1,len
		do j=1,len
			u(i,j)=0.5
		end do
	end do

	!$OMP PARALLEL DO private(temp,i,j)	
	do i=1,len
		do j=1,len
			temp = u(i,j)
			sum = sum + temp*temp
		end do
	end do
	!$OMP end PARALLEL do
	
	print *,"sum=",sum        
			
end program DRB22
