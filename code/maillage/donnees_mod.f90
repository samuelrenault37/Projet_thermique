module donnees_mod
    
    use precision
    
    implicit none
    integer                           ::nb_vertices
    
    type point_2D
    real(pr), dimension(2) :: coord
    integer  :: padding ! utilité un peu floue pour le moment, mais c'est pour l'alignement mémoire (ça nous sera pas forcement utile pour le moment)
    end type point_2D
    
    type triangles
    integer , dimension(:), allocatable ::  vertex_ID
    integer , dimension(:), allocatable ::  neighbor_ID
    real(pr), dimension(:), allocatable  ::  sub_determinant
    integer :: num  ! number of triangles
    integer :: allocated_num    ! capacity [in triangles]
    end type triangles

    type vertices
    type(point_2D), dimension(:), allocatable :: vertex
    integer :: num  ! number of vertices
    integer :: allocated_num    ! capacity [in vertices]
    end type vertices

    type mesh
    type(triangles) :: triangles
    type(vertices) :: vertices
    end type mesh

    type(mesh) :: mesh

    contains
    
    
    
end module donnees_mod
