.text

.global _start

_start:
	MOV R7, #3	@ sys_read
	MOV R0, #0	@ stdin
	MOV R2, #1	@ len to read
	LDR R1, =character	@ load address of character
	SWI 0

_uppercase:
	LDR R1, =character	@ get address of character
	LDR R0, [R1]		@ load value at address in R1
	BIC R0, R0, #32		@ clear the bit in location 2^5

	STR R0, [R1]		@ store the value of R0 in address of R1
	SWI 0

_write:
	MOV R7, #4	@ sys_write
	MOV R0, #1	@ stdout
	MOV R2, #1	@ len to output
	LDR R1, =character
	SWI 0

end:
	MOV R7, #1	@ sys_exit
	SWI 0

.data
character:
	.ascii " "

