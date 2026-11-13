module donnees_mod
    
    use precision_mod
    
    implicit none
    integer ::nb_vertices
    
    type point_2D_t
    real(pr), dimension(2) :: coord
    integer  :: padding ! utilité un peu floue pour le moment, mais c'est pour l'alignement mémoire (ça nous sera pas forcement utile pour le moment)
    end type point_2D_t
    
    type triangles_t
    integer , dimension(:), allocatable ::  vertex_ID
    integer , dimension(:), allocatable ::  neighbor_ID
    real(pr), dimension(:), allocatable  ::  sub_determinant
    integer :: num  ! number of triangles
    integer :: allocated_num    ! capacity [in triangles]
    end type triangles_t
    
    type vertices_t
    type(point_2D_t), dimension(:), allocatable :: vertex
    integer :: num  ! number of vertices
    integer :: allocated_num    ! capacity [in vertices]
    end type vertices_t
    
    type mesh_t
    type(triangles_t) :: triangles
    type(vertices_t) :: vertices
    end type mesh_t
    
    type(mesh_t) :: mesh
    
    contains
    
end module donnees_mod
