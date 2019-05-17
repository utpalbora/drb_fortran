subroutine mv
	implicit none
	integer :: i,j
	double precision,dimension(0:999,0:999)::a
	double precision,dimension(0:999)::v,v_out
	real :: sum
	
	do i=0,999
		sum = 0.0
		!$OMP parallel do reduction(+:sum)
		do j=0,999
			sum = sum + a(i,j)*v(j)
		end do
		!$OMP end parallel do
		v_out(i) = sum
	end do
		

		
end subroutine mv
 
program DB62

	implicit none
	call mv()
	
end program DB62
