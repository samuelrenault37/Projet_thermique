F90 = gfortran
FFLAGS = -Wall -Wextra -g -fcheck=all -ffree-line-length-none -ffpe-trap=invalid,zero,overflow -fbounds-check
EXE = exec

all : $(EXE)

blalalala

$(EXE) : main.o donnees_mod.o precision_mod.o
	$(F90) $(FFLAGS) -o $(EXE) $^

precision_mod.o : precision_mod.f90
	$(F90) $(FFLAGS) -c $<

donnees_mod.o : donnees_mod.f90 precision_mod.o
	$(F90) $(FFLAGS) -c $<

main.o : main.f90 donnees_mod.o precision_mod.o 
	$(F90) $(FFLAGS) -c $<

clean : 
	rm -f *.o *.mod $(EXE)
