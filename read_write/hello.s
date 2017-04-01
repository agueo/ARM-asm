/* Assembly tutorial -- hello world program */
.text

.global _start
_start:
	MOV R7, #4		@ set R7 to system call 4 -- means we want to write stream
	MOV R0, #1		@ Set R0 to 1  -- means we want the output stream to be monitor
	MOV R2, #12		@ length of string
	LDR R1, =message	@ Loads our string into R1
	SWI 0

end:
	MOV R7, #1		@ tells program to exit
	SWI 0

.data
message:
	.ascii "Hello, World."
