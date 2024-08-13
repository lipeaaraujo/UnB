.data # Data definitions.
	breakl: .string "\n"
	op_buffer: .space 3		# 1 bit buffer for option character.
	
.text # Text definitions.
main:
	# Get the option.
	li a7, 8			# ReadString service.
	la a0, op_buffer		# Load the address to save the character.
	li a1, 3			# Limit the number of characters to read.
	ecall				# Read the option.
	lbu s0, op_buffer		# s0 = option.
	
	
	# Get the number of characters of the string.
	li a7, 5			# ReadInt service.
	ecall				# Read the number of characters of the string.
	add s1, a0, zero		# s1 = size.
	
	# Allocate memory and get the input string.
	li a7, 9			# Sbrk service.
	addi a0, s1, 1			# Number of bytes of memory to allocate.
	ecall				# Allocate memory for the string.
	add s2, a0, zero		# s2 = address of string.
	
	li a7, 8			# ReadString service.
	add a0, s2, zero		# Address of input buffer.
	addi a1, s1, 2			# Maximum number of characters.
	ecall				# Read the string.
	
	# Switch case for the option.
	addi t0, zero, 77		# 'M' ASCII value.
	beq s0, t0, option_M		# case 'M':
	
	addi t0, zero, 109		# 'm' ASCII value.
	beq s0, t0, option_m		# case 'm':
	
	addi t0, zero, 99		# 'c' ASCII value.
	beq s0, t0, option_c		# case 'c':
	
	option_M:
		add a0, s1, zero	# Load the size into a0.
		add a1, s2, zero	# Load the initial string address into a1.
		jal string_to_uppercase	# Turn the string uppercase.
		j switch_out		# Break the switch.
	option_m:
		add a0, s1, zero	# Load the size into a0.
		add a1, s2, zero	# Load the initial string address into a1.
		jal string_to_lowercase	# Turn the string lowercase.
		j switch_out		# Break the switch.
	option_c:
		add a0, s1, zero	# Load the size into a0.
		add a1, s2, zero	# Load the initial string address into a1.
		jal to_uppercase_first_letters	# Convert the first letter of each word to uppercase.
		j switch_out		# Break the switch.
	switch_out:
	
	# Print the modified string.
	li a7, 4 			# Print string service.
	add a0, s2, zero		# Load the string address.
	ecall				# Print the string.
	
	# Deallocate memory.
	li a7, 9			# Sbrk service.
	sub t0, s1, zero		# Calculate number of bytes to free.
	addi a0, t0, -1			# Number of bytes of memory to deallocate.
	ecall				# Allocate memory for the string.
	
	li a7, 10			# Exit service.
	ecall				# Exit program.
	
limpa_buffer:
	# Function to clear input buffer.
	li a0, 0
	li a1, 0
	li a2, 0
	li a7, 63			# Read service.
	ecall				# Clear buffer.
	
	jr ra				# Return to caller.
	
string_to_uppercase:
	# Loop through all characters in the string and turn them uppercase
	# a0 = string size. a1 = string initial address.
	add t0, zero, zero		# Loop iterator (i).
	add t1, a1, zero		# Address of the current string character.
	
	# Loop through the string.
	loop1:
		lbu t2, 0(t1)		# t2 = string[i].
		
		# Check if the character is lowercase.
		# if (string[i] >= 97 && string[i] <= 122).
		addi t3, zero, 97
		addi t4, zero, 122
		blt t2, t3, is_upper1
		bgt t2, t4, is_upper1
			addi t2, t2, -32	# Turn the character uppercase.
			sb t2, 0(t1)		# Store back into the address. 
		is_upper1:
		
		addi t0, t0, 1		# i++.
		
		bge t0, a0, done1	# Branch if(i >= size).
		
		addi t1, t1, 1		# Move the address to the next string character.
		j loop1			# Jump back to the loop.
	done1:
	
	jr ra				# Return to caller.

string_to_lowercase:
	# Loop through all characters in the string and turn them lowercase.
	# a0 = string size. a1 = string initial address.
	add t0, zero, zero		# Loop iterator (i).
	add t1, a1, zero		# Address of the current string character.
	
	# Loop through the string.
	loop2:
		lbu t2, 0(t1)		# t2 = string[i].
		
		# Check if the character is uppercase.
		# if (string[i] >= 65 && string[i] <= 90).
		addi t3, zero, 65
		addi t4, zero, 90
		blt t2, t3, is_lower1
		bgt t2, t4, is_lower1
			addi t2, t2, 32		# Turn the character lowercase.
			sb t2, 0(t1)		# Store back into the address.
		is_lower1:
		
		addi t0, t0, 1		# i++.
		
		bge t0, a0, done2	# Branch if(i >= size).
		
		addi t1, t1, 1		# Move the address to the next string character.
		j loop2			# Jump back to the loop.
	done2:
	
	jr ra				# Return to caller.
	
to_uppercase_first_letters:
	# Convert the first letter of each word to uppercase.
	# a0 = string size. a1 = string initial address.
	add t0, zero, zero		# Loop iterator (i).
	add t1, a1, zero		# Address of the current string character.
	
	# Check if the first character is lowercase.
	lbu t2, 0(a1)		# t2 = string[0].
	
	addi t3, zero, 97
	addi t4, zero, 122
	blt t2, t3, is_upper2
	bgt t2, t4, is_upper2
		addi t2, t2, -32	# Turn the character uppercase.
		sb t2, 0(a1)		# Store back into the address.
	is_upper2:
	
	# Loop through the string.
	loop3:
		lbu t2, 0(t1)		# t2 = string[i].
		
		# Check if the character is a space.
		addi t3, zero, 32	# Space ASCII code.
		bne t2, t3, not_space	# Branch if(string[i] != 32).
		
		# Check if the next character is uppercase.
		# if (string[i] >= 97 && string[i] <= 122).
		lbu t5, 1(t1)		# Load the next character into t5.
		addi t3, zero, 97
		addi t4, zero, 122
		blt t5, t3, is_upper3
		bgt t5, t4, is_upper3
			addi t5, t5, -32	# Turn the character lowercase.
			sb t5, 1(t1)		# Store back into the address.
		is_upper3:
		
		not_space:
		
		addi t0, t0, 1		# i++.
		
		bge t0, a0, done3	# Branch if(i >= size).
		
		addi t1, t1, 1		# Move the address to the next string character.
		j loop3			# Jump back to the loop.
	done3:
	
	jr ra				# Return to caller.
