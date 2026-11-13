module function_mod
    
    use precision_mod
    use donnees_mod
    
    implicit none
    
    contains
    
    subroutine init()

        type(triangles_t) :: triangles
        type(vertices_t) :: vertices
        
        OPEN(1,file="../data/generated_points.dat")
        READ (1,*) nb_vertices

        mesh%triangles = triangles
        mesh%vertices = vertices

        ! Initialize the number of tetrahedra and vertices
        mesh%triangles%num = 0
        mesh%vertices%num = 0
        mesh%triangles%allocated_num = nb_vertices
        mesh%vertices%allocated_num = nb_vertices
        
        ! Allocate memory for the tetrahedra and vertices arrays
        allocate(mesh%triangles%vertex_ID(nb_vertices))
        allocate(mesh%triangles%neighbor_ID(nb_vertices))
        allocate(mesh%triangles%sub_determinant(nb_vertices))
        
        allocate(mesh%vertices%vertex(nb_vertices))
        
    end subroutine init
    
    subroutine reallocate_tab(tab, new_size)
        integer, allocatable, intent(inout) :: tab(:)
        integer, intent(in) :: new_size
        integer, allocatable :: tmp(:)
        integer :: n
        
        n = size(tab)
        allocate(tmp(new_size))
        tmp = 0
        tmp(1:min(n, new_size)) = tab(1:min(n, new_size))
        call move_alloc(tmp, tab)
        
    end subroutine reallocate_tab
    
end module function_mod