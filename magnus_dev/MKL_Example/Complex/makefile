##
# MKL Sample Program - Complex
#
# makefile
##

#INCLUDE=/opt/software/ClusterStudio/2011.0/mkl/include
LIBS=-lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lm

EXE=mkl-complex-example
	
$(EXE): $(EXE).c
	$(CC) -Wall $(FFLAGS) $(CFLAGS) -o $(EXE) $(EXE).c $(LIBS)
clean:
	$(RM) $(EXE)
