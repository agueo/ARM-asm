.text

.global _start
_start:
	MOV R1, #9	@1001
	MOV R2, #8	@1000
	TST R1, R2	@compares values in R1 and R2
	BEQ _bit_set	@branch if equal
	MOV R0, #1
	B end

_bit_set:	@ will never run as R1 and R2 will never be equal
	MOV R0, #0
	SWI 0

end:
	MOV R7, #1	@sys_exit
	SWI 0
