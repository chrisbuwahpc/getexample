##
# MKL Sample Program - Complex
#
# makefile
##

#INCLUDE=/opt/software/ClusterStudio/2011.0/mkl/include
LIBS=-lmkl_intel_lp64 -lmkl_sequential -lmkl_core -lm

EXE=mkl-sparse-example
	
$(EXE): $(EXE).c
	$(CXX) -Wall $(FFLAGS) $(CFLAGS) -o $(EXE) $(EXE).c $(LIBS)
clean:
	$(RM) $(EXE)
