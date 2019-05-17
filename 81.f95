subroutine f1(q)
	implicit none
	integer,intent(in)::q
	integer::x
	x =q+1
end subroutine f1

program DB81

	implicit none
	integer::i=0
	!$OMP parallel
		call f1(i)
	!$OMP end parallel
	print *,"i=",i
	
end program DB81
