.data # Data instructions.
	const5: .float 5.0
	const9: .float 9.0
	const32: .float 32.0
	
.text # Instructions

	main:
	# Get the celsius temperature.
	li a7, 6 		# ReadFloat service.
	ecall			# Read the temperature in celsius.
	
	jal cel2fahr		# Call the cel2fahr function.
	
	li, a7, 2		# PrintFloat service.
	ecall			# Print the temperature in fahrenheit.
	
	li, a7, 10
	ecall			# Exit.
	
	cel2fahr:
	# Convert celsius temperature into fahrenheit.
	fsgnj.s fs0, fa0, fa0	# Load the celsius temperature into fs0.
	
	flw ft0, const5, t0	# Load 5.0 into ft0.
	flw ft1, const9, t0	# Load 9.0 into ft1.
	flw ft2, const32, t0	# Load 32.0 into ft2.
	
	fdiv.s ft3, ft1, ft0	# Set ft3 to 9/5.
	
	fmadd.s fa0, fs0, ft3, ft2	# Calculate fa0 = (temp * 9/5) + 32.
	
	jr ra
	