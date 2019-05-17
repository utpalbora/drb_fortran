program DB1
	
	implicit none
	integer::i,len
	integer,dimension(0:999) :: a
	len=1000
	a(0)=2

        !$OMP PARALLEL DO
        do i=0, len-1
        	a(i)=a(i)+a(0)
        end do
        !$OMP end PARALLEL do 

        print '("a[500]=",I0)',a(500)
         
end program DB1
