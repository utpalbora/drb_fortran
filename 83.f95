subroutine foo
	implicit none
	integer::q=0
	q= q+1
end subroutine foo

program DB83

	implicit none
	!$OMP parallel
		call foo()
	!$OMP end parallel
	
end program DB83
