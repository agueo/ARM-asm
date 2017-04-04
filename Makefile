# makefile for assembly language ARM
# format:
# target: preconditions to be met

#hello: hello.o
#		ld -o hello hello.o
#hello.o: hello.s
#		as -o hello.o hello.s


link: mult.o logic.o
	ld _o mult.t read.t
	ld -o read.t read.o
	ld -o logic.t logic.o
	ld -o loop.t loop.o

assemble: logic.s mult.s
	as -o mult.o mult.s
	as -o read.o read.s
	as -o logic.o logic.s
	as -o loop.o loop.s

clean:
		rm *.o *.t
