.data # Data definitions.
str1:
	.string "X = " 			# First string label, (X = ).
str2:
	.string "\n" 			# Second string label, breakline.
	
.text # Instructions definitions.
main:
	# s0 = A, s1 = B.
	li, a7, 5 			# Load the ReadInt service into a7.
	ecall 				# Read an integer.
	add s0, a0, zero 		# Add the entered value into s0.
	
	ecall				# Read an integer.
	add s1, a0, zero		# Add the entered value into s1.
	
	li, a7, 4			# Load PrintString service into a7.
	la a0, str1			# Load the str1 address into a0.
	ecall				# Print "X = "
	
	li, a7, 1			# Load PrintInt service into a7.
	add a0, s0, s1			# Load into a0, (s0 + s1) or (A + B).
	ecall				# Print the integer result.
	
	li, a7, 4			# Load PrintString service into a7.
	la a0, str2			# Load the str2 address into a0.
	
	li, a7, 10			# Load the Exit service into a7.
	ecall				# Exit the program.