CC = gcc
CFLAGS = -O2 -Wall -I .

# This flag includes the Pthreads library on a Linux box.
# Others systems will probably require something different.
LIB = -lpthread

all: renamer

run: all
	./renamer $(TEST1) $(TEST2)
#	./renamer "*cs283" "engr232" "html"	

renamer: csapp.o renamer.c
	$(CC) $(CFLAGS) -o renamer renamer.c csapp.o $(LIB)

csapp.o:
	$(CC) $(CFLAGS) -c csapp.c

cgi:
	(cd cgi-bin; make)

clean:
	rm -f *.o renamer
