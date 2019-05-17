program DRB23

	implicit none
	integer :: i
	i=0

	!$omp sections	
		!$omp section	
			i=1
		!$omp section
			i=2
	!$omp end sections

	print *,"i=",i        
	
end program DRB23
