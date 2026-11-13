module function_mod
    
    use precision_mod
    use donnees_mod
    
    implicit none
    
    contains
    
    subroutine init()

        call init_mesh()
        
        call init_vertices()
    
        mesh%triangles%num = 0

        allocate(mesh%triangles%vertex_ID(nb_vertices))
        allocate(mesh%triangles%neighbor_ID(nb_vertices))
        allocate(mesh%triangles%sub_determinant(nb_vertices))
        mesh%triangles%allocated_num = nb_vertices

    end subroutine init
    
    subroutine init_vertices()
        integer :: i, ID

        open(1,file="../data/generated_points.dat")
        read (1,*) nb_vertices
        mesh%vertices%num = nb_vertices

        allocate(mesh%vertices%vertex(nb_vertices))
        mesh%vertices%allocated_num = nb_vertices
        
        do i = 1, nb_vertices
            read (1,*) ID, mesh%vertices%vertex(ID)%coord(1), mesh%vertices%vertex(ID)%coord(2)
        end do
        
        close(1)
    end subroutine init_vertices
    
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