.data # Data definitions:
str:
	.string "\n" # Label the string position in memory

.text # Text definitions:
main: # Main label.

	li a7, 5 # ReadInt syscall.
	ecall # Read the first integer.
	add s0, a0, zero # Put the first int into s0.
	
	li a7, 5 # ReadInt syscall.
	ecall # Read the second integer.
	add s1, a0, zero # Put the second int into s1.
	
	add s2, s1, s0 # s2 = s1 + s0.
	add a0, s2, zero # Put the sum into a0 (integer to print).
	li a7, 1 # PrintInt syscall.
	ecall # Print the sum.
	
	la a0, str # Load the address of str into a0.
	li a7, 4 # PrintString syscall.
	ecall # Print \n.
	
	li a0, 0 # Load the exit code into a0.
	li a7, 93 # Exit syscall.
	ecall # Issue the call.