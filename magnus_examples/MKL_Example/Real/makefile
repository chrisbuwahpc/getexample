##
# MKL Sample Program - Real
#
# makefile 
##

#INCLUDE=/opt/software/ClusterStudio/2011.0/mkl/include
LIBS=-lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lm

EXE=mkl-real-example
	
$(EXE): $(EXE).c
	$(CC) -Wall $(FFLAGS) $(CFLAGS) -o $(EXE) $(EXE).c $(LIBS)
clean:
	$(RM) $(EXE)
