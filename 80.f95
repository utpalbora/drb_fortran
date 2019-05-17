subroutine f1(q)
	implicit none
	integer,intent(out)::q
	q =q+1
end subroutine f1

program DB80

	implicit none
	integer::i=0
	!$OMP parallel
		call f1(i)
	!$OMP end parallel
	print *,"i=",i
	
end program DB80
