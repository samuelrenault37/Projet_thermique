module donnees

    use precision
    
    implicit none
    integer                           ::n , ID
    real,dimension(:),allocatable     :: x , y
    
contains

subroutine init_donnees()
    
    OPEN(1,file="donnees.dat")
    READ (1,*) n
    CLOSE(1)
    
end subroutine init_donnees

subroutine init_point()
integer :: i 
    OPEN(1,file="../data/generated_points.dat")
    
    do i = 1, n 
        READ (1,*) ID , x(i) , y(i)
    end do 
    
    CLOSE(1)

end subroutine init_point

subroutine init_tab()

    allocate(x(n),y(n))

end subroutine init_tab


subroutine dealocate_all

    deallocate(x,y)
end subroutine dealocate_all


    
end module donnees
