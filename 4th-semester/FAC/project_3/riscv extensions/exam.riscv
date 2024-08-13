.data # Data definitions.
breakl: .string "\n"

.text # Instructions definitions.
main: # Main label.
	# Get number of questions
	li a7, 5			# ReadInt service.
	ecall				# Read the number of questions.
	
	# s0 = num_questions, s1 = num_correct.
	add s0, a0, zero		# Add the number of questions to s0.
	
	# Memory allocation for answer sheet and answers.
	li a7, 9			# Allocate heap memory service.
	addi a0, s0, 1			# Add quantity of bytes to a0.
	ecall				# Allocate memory.
	
	addi s2, a0, 0			# s2 = address of answer sheet.
	
	addi a0, s0, 1			# Add quantity of bytes to a0.
	ecall				# Allocate memory.
	
	addi s3, a0, 0			# s3 = address of answers.
	
	# Get the answer sheet and answers.
	li a7, 8			# ReadString service.
	add a0, s2, zero		# Load the address to input the string.
	addi a1, s0, 2			# Max number of characters to read = num_questions + 1.
	ecall				# Read the answer sheet.
	
	li a7, 8			# ReadString service.
	add a0, s3, zero		# Load the address to input the string.
	addi a1, s0, 2			# Max number of characters to read = num_questions + 1.
	ecall				# Read the answers.
	
	# Compare answers and answer_sheet.
	add t0, zero, zero		# Initialize t0 = 0.
	add t1, s2, zero		# t1 = &answer_sheet[0]. 
	add t2, s3, zero		# t2 = &answers[0].
	add s4, zero, zero		# s4 = num_correct = 0.
	
	loop:
		lbu t3, 0(t1)		# t3 = answer_sheet[i].
		lbu t4, 0(t2)		# t4 = answers[i].
		
		bne t3, t4, out		# Branch if (t3 != t4).
			addi s4, s4, 1	# num_correct++.
		out:
		
		addi t0, t0, 1		# t0++.
		
		bge t0, s0, done	# Branch to the loop if t0 >= s0.
		
		addi t1, t1, 1		# t1 = &answer_sheet[i+1].
		addi t2, t2, 1		# t2 = &answers[i+1].
		
		j loop			# Jump back into the loop.
	done:
	
	# Show the number of corrects answers in the screen.
	li a7, 1			# PrintInt service.
	add a0, s4, zero		# Load num_correct into a0.
	ecall				# Print num_correct.
	
	# Break line.
	li a7, 4			# Print string service.
	la a0, breakl			# Load string address.
	ecall
	
	# Free all memory allocated.
	li a7, 9			# Sbrk service.
	add a0, s0, zero		# Number of bytes to be deallocated.
	ecall				# Free memory.
	add a0, s0, zero		# Number of bytes to be deallocated.
	ecall				# Free memory.
	
	# Exit program.
	li a7, 10
	ecall
		
	