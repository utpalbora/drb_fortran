program DB79

	implicit none
	integer::i=0,j,k

	!$OMP parallel
	!$OMP single
		!$OMP task depend(out:i)
			call sleep(3)
			i=1
		!$OMP end task	
		!$OMP task depend(in:i)
			j=i
		!$OMP end task		
		!$OMP task depend(in:i)
			k=i
		!$OMP end task					
	!$OMP end single	
	!$OMP end parallel

	print *,"j=",j," k=",k
	
end program DB79
