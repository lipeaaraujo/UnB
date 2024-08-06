.text # Instructions definitions.
main:
	li a7, 5		# ReadInt service.
	ecall			# Read an integer.
	jal factorial		# Call factorial function.
	
	li a7, 1		# PrintInt syscall.
	ecall			# Print the result.
	
	li a7, 10		# Exit syscall.
	ecall			# Exit the program.
	
factorial:
	addi sp, sp, -12	# Open space on the stack for 3 registers.
	
	sw t0, 8(sp)		# Save t0 on the stack.
	sw t1, 4(sp)		# Save t1 on the stack.
	sw t2, 0(sp)		# Save t2 on the stack.

	li t0, 1		# Result = 1.
	li t1, 1		# Initial value of the loop (i).
	add t2, a0, zero 	# End value of the loop (n).
	
	loop:
		mul t0, t0, t1		# Result *= i.
		addi t1, t1, 1		# i++.
		
		ble t1, t2, loop	# Branch back to loop if i < n.
		
	add a0, t0, zero	# Store the result in the return value.
	
	lw t0, 8(sp)		# Load t0 from the stack.
	lw t1, 4(sp)		# Load t1 from the stack.
	lw t2, 0(sp)		# Load t2 from the stack.
	
	addi sp, sp, 12		# Deallocate stack space.
	
	jr ra			# Return to caller.