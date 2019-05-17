
subroutine foo
	implicit none
	integer,pointer::counter
	common /glb/ counter
	
	counter = counter+1	
end subroutine foo

program DB88
	
	implicit none
	integer,pointer::counter
	integer,target::i
	common /glb/ counter
	counter => i
	counter =0
 	!$OMP parallel
 		call foo()
 	!$OMP end parallel

	print *,"",counter

end program DB88
