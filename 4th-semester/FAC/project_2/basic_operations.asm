.data # Data definitions.
	str_add: .string "ADD: "
	str_sub: .string "SUB: "
	str_and: .string "AND: "
	str_or: .string "OR: "
	str_xor: .string "XOR: "
	str_mask: .string "MASK: "
	str_sll: .string "SLL("
	str_srl: .string "SRL("
	str_s_end: .string "): "
	str_endl: .string "\n"
	
.text # Instructions definitions.

main:
	
	li a7, 5		# ReadInt service.
	ecall			# Read an integer.
	add s0, a0, zero	# s0 = a.
	
	ecall			# Read an integer.
	add s1, a0, zero	# s1 = b.
	
	ecall			# Read an integer.
	add s2, a0, zero	# s2 = c.
	
	# Addition.
	li a7, 4		# PrintString service.
	la a0, str_add		# Load the string address into a0.
	ecall			# Print "ADD: " into the screen.
	
	add a0, s0, s1		# a + b.
	li a7, 1		# PrintInt service.
	ecall			# Print the addition result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# Subtraction.
	li a7, 4		# PrintString service.
	la a0, str_sub		# Load the string address into a0.
	ecall			# Print "SUB: " into the screen.
	
	sub a0, s0, s1		# a - b.
	li a7, 1		# PrintInt service.
	ecall			# Print the subtraction result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# And.
	li a7, 4		# PrintString service.
	la a0, str_and		# Load the string address into a0.
	ecall			# Print "AND: " into the screen.
	
	and a0, s0, s1		# a and b.
	li a7, 1		# PrintInt service.
	ecall			# Print the and operation result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# Or.
	li a7, 4		# PrintString service.
	la a0, str_or		# Load the string address into a0.
	ecall			# Print "OR: " into the screen.
	
	or a0, s0, s1		# a or b.
	li a7, 1		# PrintInt service.
	ecall			# Print the or operation result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# Xor.
	li a7, 4		# PrintString service.
	la a0, str_xor		# Load the string address into a0.
	ecall			# Print "XOR: " into the screen.
	
	xor a0, s0, s1		# a xor b.
	li a7, 1		# PrintInt service.
	ecall			# Print the xor operation result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# Mask.
	li a7, 4		# PrintString service.
	la a0, str_mask		# Load the string address into a0.
	ecall			# Print "MASK: " into the screen.
	
	andi s3, s2, 31		# s3(m) = c and 31.
	add a0, s3, zero	# Storing s3 in a0. 
	li a7, 1		# PrintInt service.
	ecall			# Print the mask operation result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# Shift Left Logical.
	li a7, 4		# PrintString service.
	la a0, str_sll		# Load the string address into a0.
	ecall			# Print "SLL(" into the screen.
	
	li a7, 1		# PrintInt service.
	add a0, s3, zero	# Store m into a0.
	ecall			# Print m.
	
	li a7, 4		# PrintString service.
	la a0, str_s_end	# Load the string address into a0.
	ecall			# Print "):" into the screen.
	
	sll a0, s0, s3		# Shift a by m bits to the left.
	li a7, 1		# PrintInt service.
	ecall			# Print the shift operation result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.
	
	# Shift Right Logical.
	li a7, 4		# PrintString service.
	la a0, str_srl		# Load the string address into a0.
	ecall			# Print "SRL(" into the screen.
	
	li a7, 1		# PrintInt service.
	add a0, s3, zero	# Store m into a0.
	ecall			# Print m.
	
	li a7, 4		# PrintString service.
	la a0, str_s_end	# Load the string address into a0.
	ecall			# Print "):" into the screen.
	
	srl a0, s1, s3		# Shift b by m bits to the right.
	li a7, 1		# PrintInt service.
	ecall			# Print the shift operation result.
	
	li a7, 4		# PrintString service.
	la a0, str_endl		# Load the string address into a0.
	ecall			# Break line.