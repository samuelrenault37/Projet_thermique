F90 = gfortran
FFLAGS = -Wall -Wextra -g -fcheck=all -ffree-line-length-none -ffpe-trap=invalid,zero,overflow -fbounds-check
EXE = exec

all : $(EXE)

$(EXE) : main.o donnees.o precision.o
	$(F90) $(FFLAGS) -o $(EXE) $^

precision.o : precision.f90
	$(F90) $(FFLAGS) -c $<

donnees.o : donnees.f90 precision.o
	$(F90) $(FFLAGS) -c $<

main.o : main.f90 donnees.o precision.o 
	$(F90) $(FFLAGS) -c $<

clean : 
	rm -f *.o *.mod resultats/*.vtk *.vtk $(EXE)