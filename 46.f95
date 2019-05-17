program DB46

	implicit none
	integer,dimension(0:99,0:99)::a
	integer :: i,j
	
        !$OMP PARALLEL DO private(j)
	do i=0,99 
		do j=0,99    
			a(i,j)=a(i,j)+1
		end do
	end do	
        !$OMP end PARALLEL DO        	

end program DB46
