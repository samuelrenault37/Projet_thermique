module function
    
    use precision
    use donnees
    
    implicit none
    
    integer :: i
    
    contains
    
    subroutine init(mesh)
        type(mesh), intent(inout) :: mesh
        integer :: i
        
        ! Initialize the number of tetrahedra and vertices
        mesh%tetras%num = 0
        mesh%vertices%num = 0
        
        ! Allocate memory for the tetrahedra and vertices arrays
        allocate(mesh%tetras%vertex_ID(0))
        allocate(mesh%tetras%neighbor_ID(0))
        allocate(mesh%tetras%sub_determinant(0))
        
        allocate(mesh%vertices%vertex(0))
        
    end subroutine init_mesh
    
    subroutine reallocate_tab(tab, new_size)
        type(mesh), intent(inout) :: mesh
        
        implicit none
        integer, allocatable, intent(inout) :: tab(:)
        integer, intent(in) :: nouvelle_taille
        integer, allocatable :: tmp(:)
        integer :: n
        
        n = size(tab)
        allocate(tmp(nouvelle_taille))
        tmp = 0
        tmp(1:min(n, nouvelle_taille)) = tab(1:min(n, nouvelle_taille))
        call move_alloc(tmp, tab)
        
    end subroutine reallocate_tab
    
end module function