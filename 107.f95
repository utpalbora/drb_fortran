program DB107

	implicit none
	integer::result
	result=0
	!$OMP parallel
	!$OMP single
	!$OMP taskgroup
		!$OMP task
			call sleep(3)
			result=1
		!$OMP end task	
		!$OMP task
			result=2
		!$OMP end task			
	!$OMP end taskgroup	
	!$OMP end single	
	!$OMP end parallel

	print *,"result=",result
end program DB107
