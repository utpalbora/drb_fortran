program DB113

	implicit none
	integer::i,j,len
	integer,dimension(0:99,0:99) :: a,b
	
	!$OMP parallel do default(none) shared(a) private(i,j)
	do i=0,99
		do j=0,99
			a(i,j)=a(i,j)+1
		end do	
	end do
	!$OMP end parallel do
	
	!$OMP parallel do default(shared) private(i,j)
	do i=0,99
		do j=0,99
			b(i,j)=b(i,j)+1
		end do	
	end do
	!$OMP end parallel do
		
end program DB113
