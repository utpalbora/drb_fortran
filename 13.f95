program DB13

	implicit none
	integer::i,error,b,len
	integer,dimension(:),allocatable::a
	len=1000	
	allocate(a(0:len-1))
	b=5
	
	do i=0,len-1 
		a(i)=i
	end do

        !$OMP PARALLEL shared(b,error)
                !$OMP DO 	
		do i=0,len-1 
			a(i)=b+a(i)*5
		end do
                !$OMP end do nowait         
        	!$OMP single
        		error = a(9)+1
                !$OMP end single        
        !$omp end parallel
        
        print '("error=",I0)',error	        
        	        	
end program DB13
