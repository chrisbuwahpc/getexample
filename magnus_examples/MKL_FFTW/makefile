BASE_PATH=/opt/software/ClusterStudio/2013sp1/composer_xe_2013_sp1.0.080
MKL_INC=-I$(BASE_PATH)/mkl/include
INTEL_LPATH=-L$(BASE_PATH)/mkl/lib/intel64
INTEL_LIBS=-lmkl_intel_lp64 -lmkl_intel_thread -lmkl_core -liomp5 -lpthread -lm

both: test_c  test_f
all: both c_test f_test

test_f: test.f90
	ifort test.f90 $(MKL_INC)/fftw -mkl -o test_f

test_c: test.c
	icc test.c $(COPTS) $(MKL_INC)/fftw -mkl -o test_c

c_test: test.c
	icc test.c $(COPTS) $(MKL_INC) $(MKL_INC)/fftw $(INTEL_LIBS) $(INTEL_LPATH) $(FFTW3C) -o c_test 

f_test: test.f90
	ifort test.f90 $(MKL_INC) $(MKL_INC)/fftw $(INTEL_LIBS) $(INTEL_LPATH) $(FFTW3F) -o f_test 

test: both
	./test_c > c1.out
	./test_f > f1.out
	diff -s c1.out f1.out

clean:
	rm -rf c_test test_c f_test test_f *out

