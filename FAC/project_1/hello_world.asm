.data # Tell the assembler this is data.
message: # Label the message position in memory.
	.string "Ola Mundo\n" # String to be shown on the screen

.text # Tell the assembler this is code.
main: # Main label, where the program starts.
	
	li a0, 1 # Load 1 into a0, the file descriptor.
	la a1, message # Load into the buffer, the address of message.
	li a2, 10 # Load 10 into a2, the lenght of the message.
	li a7, 64 # Load the 64 into a7, (write syscall).
	ecall # Issue call.
	
	li a0, 0 # Load 0 into a0, the value to exit the code with.
	li a7, 93 # Load 93 into a7, (exit2 syscall).
	ecall # Issue call.
	
