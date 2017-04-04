/* using logical shift left to multiply by 2 */

.global _start
_start:
	MOV R1, #15
	MOV R0, R1, LSL #1		@ Shifts the value in R1 by 1 bit value
	MOV R1, #30
	MOV R0, R1, LSR #1

end:
	MOV R7, #1
	SWI 0
