.data	# Data definitions.
	messageNotPrime: .string "O modulo nao eh primo.\n"
	messageInvalid: .string "Entradas invalidas.\n"
	messageResult1: .string "A exponencial modular "
	messageResult2: .string " elevado a "
	messageResult3: .string " (mod "
	messageResult4: .string ") eh "
	messageResult5: .string ".\n"

.text	# Instructions definitions.
main:
	# Get num, exp and mod.
	li a7, 5
	ecall						# Read the number.
	add s0, a0, zero
	
	ecall						# Read the exponent.
	add s1, a0, zero
	
	ecall						# Read the module.
	add s2, a0, zero
	
	# Verify if values are valid.
	blez s0, invalidValues
	blez s1, invalidValues
	blez s2, invalidValues
	
	# Verify if mod is prime.
	add a0, s2, zero
	jal checkPrime				# Call check prime function.
	beqz a0, modNotPrime		# Check if the return was 0.
	
	# Calculate the remainder.
	add a0, s0, zero
	add a1, s1, zero
	add a2, s2, zero
	jal modularRem				# Call calculate remainder function.
	add s3, a0, zero			# Store the return value.
	
	j printResult
	
	modNotPrime:	# Print "O modulo nao eh primo."
	li a7, 4
	la a0, messageNotPrime
	ecall
	
	j exit
	
	invalidValues:	# Print "Entradas invalidas" and exit.
	li a7, 4
	la a0, messageInvalid
	ecall
	
	j exit
	
	printResult:	# Print the result.
	li a7, 4
	la a0, messageResult1
	ecall
	
	li a7, 1
	add a0, s0, zero
	ecall
	
	li a7, 4
	la a0, messageResult2
	ecall
	
	li a7, 1
	add a0, s1, zero
	ecall
	
	li a7, 4
	la a0, messageResult3
	ecall
	
	li a7, 1
	add a0, s2, zero
	ecall
	
	li a7, 4
	la a0, messageResult4
	ecall
	
	li a7, 1
	add a0, s3, zero
	ecall
	
	li a7, 4
	la a0, messageResult5
	ecall
	
	exit:	# Exit the program with code 0.
	li a7, 10
	ecall

checkPrime: # Checks if a number is prime or not.
	
	add t0, a0, zero			# Store num in t0.
	li t1, 1					# t1 = 1.
	li t2, 2					# t2 = 2.
	
	ble t0, t1, notPrime		# Check if num <= 1.
	beq t0, t2, isPrime			# Check if num == 2.
	
	checkPrimeLoop:
	rem t3, t0, t2				# t3 = num % i.
	beqz t3, notPrime			# Check if the remainder is zero.
	addi t2, t2, 1				# i++.
	blt t2, t0, checkPrimeLoop	# Check if i < num.
	
	isPrime:					# Return 1, if the number is prime.
	li a0, 1
	jr ra
	
	notPrime:					# Return 0, if the number isn't prime.
	li a0, 0
	jr ra
	
modularRem:
	li t0, 0					# initialize i = 0.
	li t1, 1					# initialize t1 = 1.
	
	modularRemLoop:				# Calculate num ^ exp.
	mul t1, t1, a0				
	addi t0, t0, 1				# i++
	blt t0, a1, modularRemLoop	# Check if i < exp.
	
	rem a0, t1, a2				# Calculate (num**exp) mod(prime).
	jr ra						# Return remainder in a0.