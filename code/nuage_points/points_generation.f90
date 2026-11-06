program points_generation
    
    implicit none
    
    integer :: i, N
    real(8) :: x, y, a, b, c, d
    
    ! initailisation des bornes
    
    a = -1
    b = 1
    c = -1
    d = 1
    
    ! nombres de points
    
    N = 500
    
    ! appel de la subroutine
    
    call rectangular_area()
    
    contains
    
    subroutine rectangular_area()
        open (unit = 1, file = "../data/generated_points.dat")
        do i = 1,N
            
            x = (rand(0)*(b-a)) + a
            y = (rand(0)*(d-c)) + c
            
            write(1,*) i, x, y
            
        end do
        close(1)
    end subroutine rectangular_area
    
end program points_generation