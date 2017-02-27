EXE=eigenvalue_example

FFLAGS =  
LFLAGS = 
LIBS = -lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lm


$(EXE): $(EXE).c
	$(CC)  $(LFLAGS) -o $(EXE) $(EXE).c  $(LIBS)

.f.o:  
	$(CC) $(FFLAGS) $< -o $(<:.c=.o)

clean:
	$(RM) $(EXE)

