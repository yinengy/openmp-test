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

lib/libvec.so: lib/vec.cpp
	$(CXX) $(CFLAGS) -shared -o $@ $< -pthread

preloader.so: preloader.cpp
	$(CXX) $(CFLAGS) -shared -o preloader.so preloader.cpp -fopenmp -ldl

preload_affinity.so: preload_affinity.cpp
	$(CXX) -shared -o preload_affinity.so preload_affinity.cpp -fPIC -pthread -ldl

test: lib/libsummp.so lib/libaddmp.so test.cpp lib/libvec.so preload_affinity.so
	$(CXX) $(CFLAGS) -o test test.cpp -lvec -fopenmp -pthread -ldl 

test_openmp: test_openmp.cpp preload_affinity.cpp
	$(CXX) -o test_openmp test_openmp.cpp -fopenmp -pthread -ldl
	$(CXX) -shared -o preload_affinity.so preload_affinity.cpp -fPIC -pthread -ldl

launcher: launcher.cpp
	$(CXX) $(CFLAGS) -o $@ $< -ldl

%.so: %.o
	$(CXX) -shared -o $@ $< -fPIC

clean:
	rm -f *.o *.so lib/*.so lib/*.o main launcher preload_affinity test_openmp test