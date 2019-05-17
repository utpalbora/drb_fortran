program DRB24
	implicit none
	
	integer :: i,len
	integer,dimension(0:100) :: a,b

	len=100
	do i=0,len-1
		a(i)=i
		b(i)=i+1
	end do
	
	!$omp simd
		do i=0,len-2
			a(i+1)=a(i)+b(i)
		end do
	!$omp end simd

	do i=0,len-1
		write(*,*) "i=",i,"a[",i,"]=",a(i)
	end do

end program DRB24
