F90 = gfortran
FFLAGS = -Wall -Wextra -g -fcheck=all -ffree-line-length-none -ffpe-trap=invalid,zero,overflow -fbounds-check
EXE = exec

all : $(EXE)

$(EXE) : points_generation.o
	$(F90) $(FFLAGS) -o $(EXE) $^

points_generation.o : points_generation.f90
	$(F90) $(FFLAGS) -c $<

clean : 
	rm -f *.o *.mod $(EXE)