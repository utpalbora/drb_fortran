program DB77

	implicit none
	integer::count=0

	!$OMP parallel shared (count)
		!$OMP single
			count = count +1
		!$OMP end single	
	!$OMP end parallel
	
	print *,"count= ",count
end program DB77
