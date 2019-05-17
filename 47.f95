program DB47

	implicit none
	character,dimension(0:99)::a
	integer :: i,j
	
        !$OMP PARALLEL DO private(j)
	do i=0,99    
		a(i)=a(i)+1
	end do	
        !$OMP end PARALLEL DO        	

end program DB47
