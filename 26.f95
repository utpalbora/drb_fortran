program DRB26
	implicit none
	
	integer :: i,len
	integer,dimension(0:999) :: a

	len=1000
	do i=0,len-1
		a(i)=i
	end do
	
	!$omp target map(a(0:len))
	!$omp parallel do
		do i=0,len-2
			a(i)=a(i+1)+1
		end do
	!$omp end parallel do
	!$omp end target 	

	
end program DRB26
