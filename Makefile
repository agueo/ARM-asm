# makefile for assembly language ARM
# format:
# target: preconditions to be met

#hello: hello.o
#		ld -o hello hello.o
#hello.o: hello.s
#		as -o hello.o hello.s


link: hello.o read.o logic.o angry.o loop.o
	ld -o hello.t hello.o
	ld -o read.t read.o
	ld -o logic.t logic.o
	ld -o loop.t loop.o

assemble: hello.s read.s logic.s angry.s
	as -o hello.o hello.s
	as -o read.o read.s
	as -o logic.o logic.s
	as -o loop.o loop.s

clean:
		rm *.o *.t
