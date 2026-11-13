program main

    use function_mod
    use precision_mod
    use donnees_mod

    implicit none
    
    call init()

    print *, "Number of vertices: ", mesh%vertices%num
    
end program main