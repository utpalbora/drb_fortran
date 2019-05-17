subroutine foo(i)

	implicit none
	integer,intent(in)::i
	integer :: sum0=0,sum1=0
	common /globalsum0/ sum0
	common /globalsum1/ sum1
	!!$OMP threadprivate(/globalsum0/)
	sum0=sum0+i	
	
end subroutine foo

program DB85

	implicit none
	integer :: i,sum=0
	integer :: sum0=0,sum1=0
	common /globalsum0/ sum0
	common /globalsum1/ sum1

	!!$OMP threadprivate(/globalsum0/)
	!$OMP parallel
		!$OMP do
			do i=1,1000
				call foo(i)
			end do
		!$OMP end do
		!$OMP critical
			sum =sum+sum0
		!$OMP end critical
	!$OMP end parallel
	
	do i=1,1000
		sum1=sum1+i
	end do

	print *,"sum=",sum,";"," sum1=",sum1
	
end program DB85
