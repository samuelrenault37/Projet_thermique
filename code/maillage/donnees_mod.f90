module donnees
    
    use precision
    
    implicit none
    integer                           ::n , ID
    real,dimension(:),allocatable     :: x , y
    
    
    type point_2D
    real(pr), dimension(2) :: coord
    integer  :: padding ! utilité un peu floue pour le moment, mais c'est pour l'alignement mémoire (ça nous sera pas forcement utile pour le moment)
    end type point_2D
    
    type tetras
    integer , dimension(:), allocatable ::  vertex_ID
    integer , dimension(:), allocatable ::  neighbor_ID
    real(pr), dimension(:), allocatable  ::  sub_determinant
    integer :: num  ! number of tetrahedra
    integer :: allocated_num    ! capacity [in tetrahedra]
    end type tetras

    type vertices
    type(point_2D), dimension(:), allocatable :: vertex
    integer :: num  ! number of vertices
    integer :: allocated_num    ! capacity [in vertices
    end type vertices

    type mesh
    type(tetras) :: tetras
    type(vertices) :: vertices
    end type mesh
    
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
