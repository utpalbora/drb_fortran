program DRB27

	implicit none
	integer :: i
	i=0

	!$omp parallel 	
		!$omp single
			!$omp task	
				i=1
			!$omp end task	
			!$omp task
				i=2
			!$omp end task	
		!$omp end single	
	!$omp end parallel

	print *,"i=",i        
	
end program DRB27
