program main

    use function_mod
    use precision_mod
    use donnees_mod

    implicit none
    
    call init()

    print *, "Number of vertices: ", mesh%vertices%num
    print *, "Number of triangles: ", mesh%triangles%num
    print *, "some coordinates of vertices:", mesh%vertices%vertex(3)%coord
    
end program main