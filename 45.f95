program DB45

	implicit none
	integer,dimension(0:99)::a
	integer :: i
	
        !$OMP PARALLEL DO
	do i=0,99     
		a(i)=a(i)+1
	end do
        !$OMP end PARALLEL DO        	

end program DB45
