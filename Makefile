CC=g++
CFLAGS=-I. -I./lib -L. -fopenmp
DEPS = hellomake.h

%.o: %.cpp
	$(CC) -c -o $@ $< $(CFLAGS)

main: main.cpp lib/summp.o lib/addmp.o
	$(CC) -o main main.cpp lib/*.o $(CFLAGS)

clean:
	rm -f *.o lib/*.o main