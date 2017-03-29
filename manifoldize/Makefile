CC=g++
CFLAGS=-I. -I/usr/local/include -I/afs/cs.stanford.edu/u/jingweih/geometryprocessing/3rdparty/libigl/include -I/afs/cs.stanford.edu/u/jingweih -I/afs/cs.stanford.edu/u/jingweih/jingweih/include

DEPS = Intersection.h Model_OBJ.h Octree.h
OBJ = Intersection.o main.o Model_OBJ.o BVH.o

main: Intersection.o main.o Model_OBJ.o BVH.o
	g++ *.o -lGL -lGLU -lglut -lpng -o main
	
Intersection.o:
	g++ -std=c++11 -c -o Intersection.o Intersection.cpp -I. -I/usr/local/include -I/afs/cs.stanford.edu/u/jingweih/geometryprocessing/3rdparty/libigl/include -I/afs/cs.stanford.edu/u/jingweih -I/afs/cs.stanford.edu/u/jingweih/jingweih/include

main.o:
	g++ -std=c++11 -c -o main.o main.cpp -I. -I/usr/local/include -I/afs/cs.stanford.edu/u/jingweih/geometryprocessing/3rdparty/libigl/include -I/afs/cs.stanford.edu/u/jingweih -I/afs/cs.stanford.edu/u/jingweih/jingweih/include

Model_OBJ.o:
	g++ -std=c++11 -c -o Model_OBJ.o Model_OBJ.cpp -I. -I/usr/local/include -I/afs/cs.stanford.edu/u/jingweih/geometryprocessing/3rdparty/libigl/include -I/afs/cs.stanford.edu/u/jingweih -I/afs/cs.stanford.edu/u/jingweih/jingweih/include

BVH.o:
	g++ -std=c++11 -c -o BVH.o BVH.cpp -I. -I/usr/local/include -I/afs/cs.stanford.edu/u/jingweih/geometryprocessing/3rdparty/libigl/include -I/afs/cs.stanford.edu/u/jingweih -I/afs/cs.stanford.edu/u/jingweih/jingweih/include

clean:
	rm *.o

