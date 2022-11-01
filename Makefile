CXX=g++
CFLAGS=-I. -Ilib -Llib -fPIC -g
# GLIBC=-Wl,--rpath=/home/yyan/openmp-test/glibc/install/lib/ -Wl,--dynamic-linker=/home/yyan/openmp-test/glibc/install/lib/ld-linux-x86-64.so.2

main: main.cpp lib/libsummp.so lib/libaddmp.so lib/libaddmp2.so lib/libaddmp3.so lib/libaddmp4.so
	$(CXX) $(CFLAGS) -o main main.cpp -laddmp -laddmp2 -laddmp3 -laddmp4 -lsummp -lpthread 

%.o: %.cpp
	$(CXX) $(CFLAGS) -c -o $@ $< -fopenmp

lib/libaddmp.so: lib/addmp.o
	$(CXX) -shared -o $@ $< -fopenmp -fPIC

lib/libaddmp2.so: lib/addmp2.o
	$(CXX) -shared -o $@ $< -fopenmp -fPIC

lib/libaddmp3.so: lib/addmp3.o
	$(CXX) -shared -o $@ $< -fopenmp -fPIC

lib/libaddmp4.so: lib/addmp4.o
	$(CXX) -shared -o $@ $< -fopenmp -fPIC

lib/libsummp.so: lib/summp.o
	$(CXX) -shared -o $@ $< -fopenmp -fPIC

preloader.so: preloader.cpp
	$(CXX) $(CFLAGS) -shared -o preloader.so preloader.cpp -ldl

test: lib/dog.so lib/cat.so test.cpp
	$(CXX) $(CFLAGS) -o test test.cpp -l:dog.so -ldl  -pie

launcher: launcher.cpp
	$(CXX) $(CFLAGS) -o $@ $< -ldl

%.so: %.o
	$(CXX) -shared -o $@ $< -fPIC

clean:
	rm -f *.o *.so lib/*.so lib/*.o main launcher