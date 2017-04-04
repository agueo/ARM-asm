.data
.balign 4		@ requests 4 bytes in memory
fifteen:		@ variable name
	.word 15	@ size word has value of 15

.balign 4
thirty:
	.word 30

.text

.global _start
_start:
	LDR R1, adr_fifteen
	LDR R1, [R1]
	LDR R2, adr_thirty
	LDR R2, [R2]
	ADD R0, R1, R2

end:
	MOV R7, #1
	SWI 0


adr_fifteen: .word fifteen	@ address label for our variable
adr_thirty: .word thirty
