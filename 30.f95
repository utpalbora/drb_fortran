program DRB29

	implicit none
	integer :: i,len,number
	integer,dimension(:),allocatable :: a
	CHARACTER(LEN=20) :: buffer

	len =100
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if
	
	allocate(a(0:len-1))
	do i=0,len-1
		a(i)=i
	end do

	!$OMP PARALLEL do	
	do i=0,len-2
		a(i+1) = a(i)+1
	end do
	!$OMP end PARALLEL do
	

end program DRB29
