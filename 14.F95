program DRB14

	implicit none
	integer::i,j,n,m
	double precision,dimension(0:99,0:99):: b
	n=100
	m=100
	
	!$OMP PARALLEL DO private(j)	
	do i=1,n-1
		do j=0,m-1
			b(i,j)=b(i,j-1)
		end do
	end do
	!$OMP end PARALLEL do
	
	print *,"b[50][50]=",b(50,50)	
			
end program DRB14
