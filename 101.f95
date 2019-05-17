

program DB101

	implicit none
	integer::i
	integer,dimension(0:99)::a
	
	common /globala/ a

	!$OMP parallel
		!$OMP single
			do i=0,99
				call gen_task(i)
			end do		
		!$OMP end single	
	!$OMP end parallel

	do i=0,99
		if (a(i).ne.i+1) then
			print *,"warning: a[",i,"] = ",a(i),", not expected ",i+1
		end if
	end do

contains

subroutine gen_task(i) 
	implicit none
	integer,intent(in)::i
	!$OMP task
		a(i)=i+1
	!$OMP end task
	
end subroutine gen_task
end program DB101
