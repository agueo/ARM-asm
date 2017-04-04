/* Looping using ARM asssembly */
/* This program will take in a string of length 10 and capitalize each letter */
.text

.global _start
_start:
	MOV R3, #0			@ Set up initial value for loop
	B _continue_loop

_loop:
	ADD R3, R3, #1		@ increment R3
	B _read				@ branch to our read definition

_continue_loop:
	CMP R3, #100			@ Compares the value in R3 to 9 if less than, continue looping if greater than end
	BLE _loop
	BGT end

_read:
	MOV R7, #3			@ sys_read
	MOV R0, #0			@ stdin
	MOV R2, #1			@ len to read
	LDR R1, =character	@ load address location of where to store character
	SWI 0

_uppercase:
	LDR R1, =character	@ get address of character
	LDR R0, [R1]		@ load value at address in R1 to R0
	BIC R0, R0, #32		@ clear the bit in location 2^5

	STR R0, [R1]		@ store the value of R0 in address of R1
	SWI 0

_write:
	MOV R7, #4			@ sys_write
	MOV R0, #1			@ stdout
	MOV R2, #1			@ len to output
	LDR R1, =character
	SWI 0

next:
	B _continue_loop

end:
	MOV R7, #1
	SWI 0

.data
character:
	.ascii " "

