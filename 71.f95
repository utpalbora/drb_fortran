program DRB71
	implicit none
	
	integer :: i,len
	integer,dimension(:),allocatable :: a

	len=1000
	allocate(a(0:len-1))
	do i=0,len-1
		a(i)=i
	end do
	
	!$omp target map(a(0:len-1))
	!$omp parallel do
		do i=0,len-1
			a(i)=a(i)+1
		end do
	!$omp end parallel do
	!$omp end target 	

	
end program DRB71
