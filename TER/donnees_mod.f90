module donnees

    use precision
    
    implicit none
    integer ::n
    
contains

subroutine init_donnees()
    
    OPEN(1,file="donnees.dat")
    READ (1,*) n
    CLOSE(1)
    
end subroutine init_donnees


    
end module donnees