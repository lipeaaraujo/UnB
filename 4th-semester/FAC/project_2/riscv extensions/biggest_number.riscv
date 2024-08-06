.data	# Data definitions.
str:
	.string "\n"

.text	# Instructions definitions.
main:
	li a7, 5		# ReadInt service.
	ecall			# Read the numbers to be entered (n).
	add t0, a0, zero	# t0 = n, loop max iteration.
	add t1, zero, zero	# t1 = 0, loop iteration.
	li s0, 0x80000000	# Max number to be calculated.
	
	loop:
	li a7, 5		# ReadInt service.
	ecall			# Read the number.
	add t2, a0, zero 	# Store the current read number in t2.
	
	ble t2, s0, not_bigger	# Branch if t2 < s0, if the number entered isn't a bigger one.
	add s0, t2, zero	# s0 = t2, new biggest number.
	
	not_bigger:
	addi t1, t1, 1		# Increment t1 by 1.
	blt t1, t0, loop	# Check if t0 < t1, if so, continue the loop.
	
	li a7, 1		# PrintInt service.
	add a0, s0, zero	# Store the biggest number in a0.
	ecall			# Print the biggest number.
	
	li a7, 4		# PrintString service.
	la a0, str		# Load the string address into a0.
	ecall			# Print the breakline.
	
	li a7, 10		# Exit service.
	ecall			# Exit the program.
		
	
	
	
	
	