program DB78

	implicit none
	integer::i=0

	!$OMP parallel
	!$OMP single
		!$OMP task depend(out:i)
			call sleep(3)
			i=1
		!$OMP end task	
		!$OMP task depend(out:i)
			i=2
		!$OMP end task
	!$OMP end single	
	!$OMP end parallel
	
end program DB78
