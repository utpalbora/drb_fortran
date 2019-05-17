program DRB25
	implicit none
	
	integer :: i,len,number
	integer,dimension(:),allocatable :: a,b
	CHARACTER(LEN=20) :: buffer

	len=100
	
	buffer = ""
	CALL GET_COMMAND_ARGUMENT(1, buffer)
	read(buffer, '(I10)') number
	
	if (COMMAND_ARGUMENT_COUNT()>0) then
		len = number
	end if

	allocate(a(0:len-1),b(0:len-1))

	do i=0,len-1
		a(i)=i
		b(i)=i+1
	end do
	
	!$omp simd
		do i=0,len-2
			a(i+1)=a(i)*b(i)
		end do
	!$omp end simd


end program DRB25
