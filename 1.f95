program DB1
	
	implicit none
	integer::i,len
	integer,dimension(0:999) :: a
	
	len =1000
	
        do i=0, len-1
                a(i) = i
        end do
        
        !$OMP PARALLEL DO
        
        do i=0, len-2
        	a(i)=a(i+1)+1
        end do
        !$OMP end parallel do 
        print '("a[500]=",I0)',a(500)
         
end program DB1
