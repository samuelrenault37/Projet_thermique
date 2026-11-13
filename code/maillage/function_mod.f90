module function_mod
    
    use precision
    use donnees
    
    implicit none
    
    integer :: i
    
    contains
    
    subroutine init()
        
        OPEN(1,file="../data/generated_points.dat")
        READ (1,*) nb_vertices

        ! Initialize the number of tetrahedra and vertices
        mesh%tetras%num = 0
        mesh%vertices%num = 0
        
        ! Allocate memory for the tetrahedra and vertices arrays
        allocate(mesh%tetras%vertex_ID(nb_vertices))
        allocate(mesh%tetras%neighbor_ID(nb_vertices))
        allocate(mesh%tetras%sub_determinant(nb_vertices))
        
        allocate(mesh%vertices%vertex(nb_vertices))
        
    end subroutine init_mesh
    
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