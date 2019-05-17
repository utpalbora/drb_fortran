subroutine foo
	implicit none
	integer::i,j,n=100,m=100
	double precision,dimension(0:99,0:99)::b
	!$OMP parallel do private(j)
	do i=0,n-1
		do j=0,m-2
			b(i,j)=b(i,j+1)
		end do
	end do
	!$OMP end parallel do
		
end subroutine foo
 
program DB63

	implicit none
	call foo()
	
end program DB63
