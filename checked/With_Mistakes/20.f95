 ALLOCATE - - > Array POINTER - - > No SCOP

 program DRB20

    implicit none
    integer :: i, tmp, len, number
    integer, dimension(0:99) :: a
    CHARACTER(LEN=20) :: buffer

    len = 100

    buffer = ""
    CALL GET_COMMAND_ARGUMENT(1, buffer)
    read (buffer, '(I10)') number

    if (COMMAND_ARGUMENT_COUNT() > 0) then
       len = number
    end if

    do i = 0, len - 1
       a(i) = i
    end do

!$OMP         PARALLEL do
    do i = 0, len - 1
       tmp = a(i) + i
       a(i) = tmp
    end do
!$OMP         end PARALLEL do

 end program DRB20
