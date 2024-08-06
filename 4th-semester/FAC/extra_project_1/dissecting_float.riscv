.data # Data definitions.
	breakl: .string "\n"
	positive: .string "+"
	negative: .string "-"
	
.text # Instructions definitions.
main:
	li a7, 6		# ReadFloat service.
	ecall			# Read the floating point number.
	
	# Printing the float number.
	li a7, 2		# Print float service.
	ecall			# Print the float input.
	
	li a7, 4		# Print string service.
	la a0, breakl		# Load the address of "breakl" into a0.
	ecall			# Line break.
	
	fsgnj.s fs0, fa0, fa0	# Put the float number in fs0 register.
	fmv.x.s s0, fs0		# Move the bits from fs0 register into s0 register.
	
	# Getting the signal of the number.
	add t0, s0, zero	# Put the bits in s0 into t0.
	
	li a7, 4		# Print string service.
	
	# Printing the signal.
	bgez t0,  signal_pos	# If condition for the signal of the float number.
	# Reaches here if the signal is negative
	la a0, negative		# Load the address of "negative" into a0.
	ecall			# Print "-" into the screen.
	j signal_printed	# Jump outside.
	
	signal_pos:
	# Reaches here if the signal is positive.
	la a0, positive		# Load the address of "negative" into a0.
	ecall			# Print "+" into the screen.
	
	signal_printed:
	li a7, 4		# Print string service.
	la a0, breakl		# Load the address of "breakl" into a0.
	ecall			# Line break.
	
	# Getting the exponent.
	add t0, s0, zero	# Put the bits in s0 into t0.
	slli t0, t0, 1		# Remove the signal bit.
	srli t0, t0, 24		# Get the exponent value.
	addi t0, t0, -127	# Remove bias.
	
	li a7, 1		# PrintInt service.
	add a0, t0, zero	# Load the exponent value into a0.
	ecall			# Print the exponent.
	li a7, 4		# Print string service.
	la a0, breakl		# Load the address of "breakl" into a0.
	ecall			# Line break.
	
	# Printing the mantissa as a hex.
	add t0, s0, zero	# Load the bits into t0.
	slli t0, t0, 9		# Remove exponent and signal bits.
	srli t0, t0, 9		# Shift right to get the value of the mantissa.
	
	li a7, 34		# PrintIntHex service.
	add a0, t0, zero	# Load the bits of the mantissa into a0
	ecall
	li a7, 4		# Print string service.
	la a0, breakl		# Load the address of "breakl" into a0.
	ecall			# Line break.
	
	li a7, 10		# Exit service.
	ecall			# Exit the program.