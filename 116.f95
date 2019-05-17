program DB116
	
	implicit none
	integer::i,len
	double precision,dimension(:),allocatable::a
	len=100
	allocate(a(0:len-1))
	do i=0,len-1
		a(i) = real(i)/2.0
	end do

	!$OMP target map(tofrom: a(0:len-1))
	!$OMP teams num_teams(2)
		a(50) =a(50)*2.0
	!$OMP end teams	
	!$OMP end target
	
	print *,"a[50]=",a(50)
end program DB116
