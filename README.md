# ARM Assembly language reference
Registers:
R0 R1 R2 R3 R4 R5 R6 R7 R8 R9 R10 R11 R12 SP LR PC

R0 - R12 -- general registers though some hold special values
R7 - used for system calls
SP - Stack pointer to active stack
LR - Holds address of subroutine for when subroutine needs to be called
PC - Program counter -- stores address of next instruction

## CPSR - current program stack register
values change everytime you call an instructions
---------------------------------------------------------------------
|	31	|	30	|	29	|	28	|	27-8	|	7-6	|	5	|	4-0	|
|	N	|	Z	|	C	|	V	|	Not-used|	IF	|	T	|  MODE	|
|--------------------------------------------------------------------

# SYSCALL VALUES for R7
1 - exit the program (sys_exit)
3 - read from stream (sys_read)
4 - write to stream (sys_write)
5 - open (sys_open) 
6 - close (sys_close)

# STREAM VALUES FOR R0
0 - input from stdin / keyboard
1 - output to stdout / monitor

# Looping example
Example code of a while(R0 <= 9) loop
.global _start
_start:
	MOV R0, #0
	MOV R1, #1
	B _continue_loop

_loop:
	ADD R0, R0, #1

_continue_loop:
	CMP R0, #9
	BLE _loop

end
	MOV R7, #1
	SWI 0

## Using memory as storage
### Variables
Variables need to go in the .data section.
ex.
	
.data
.balign 4
var_name:
	.word 0x61

--snip-- (somewhere in code)
addr_var_name: .word var_name

In the example above we ask for 4 bytes of space for our vatiable by using balign. We then use a label for the vatiable name and finally tell it what type of data to hold.
We also need to place an address somewhere in code near where it will be needed. We do this by giving it a label for address and calling its data label stored in the data section.

###Using the data
To use the stored data we use:
LDR <dst> <src>
STR <src> <dst>
