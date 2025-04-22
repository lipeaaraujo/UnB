.data # Data definitions.
str1:
	.string "Valores aceitos\n"
str2:
	.string "Valores nao aceitos\n"

.text # Instructions definitions.

main:  	# Main label.
	# s0 = A, s1 = B, s2 = C, s3 = D
	
	li a7, 5		# Load ReadInt service into a7.
	ecall			# Read an integer.
	add s0, a0, zero	# Load the entered integer into s0.

	ecall			# Read an integer.
	add s1, a0, zero	# Load the entered integer into s1.
	
	ecall			# Read an integer.
	add s2, a0, zero	# Load the entered integer into s2.
	
	ecall			# Read an integer.
	add s3, a0, zero	# Load the entered integer into s3.
	
	# conditions: (B > C), (D > A), ((C+D) > (A+B)), C > 0, D > 0, A % 2 == 0
	
	bgt s1, s2, cond1	# Branch if s1 > s2, if(B > C).
	j not_accepted 		# If (B <= C), do not accept the values.
	
cond1:
	bgt s3, s0, cond2	# Branch if s3 > s0, if(D > A).
	j not_accepted		# If (D <= A), do not accept the values.
	
cond2:
	add t0, s0, s1		# t0 = (A + B).
	add t1, s2, s3		# t1 = (C + D).
	bgt t1, t0, cond3	# Branch if t1 > t0, if((C+D) > (A+B)).
	j not_accepted		# If ((C+D) <= (A+B)), do not accept the values.
	
cond3:
	add t0, zero, zero	# t0 = 0
	bgt s2, t0, cond4	# Branch if s2 > t0, if(C > 0).
	j not_accepted		# If (C <= 0), do not accept the values.
	
cond4:
	bgt s3, t0, cond5	# Branch if s3 > t0, if(D > 0).
	j not_accepted		# If (D <= 0), do not accept the values.
	
cond5:
	addi t1, zero, 2	# t1 = 2.
	rem t0, s0, t1 		# t0 = A % 2
	beqz t0, accepted	# Branch if t0 % 2 == 0.
	j not_accepted		# If (t0 % 2 != 0), do not accept the values.
	
accepted:
	li a7, 4		# Load the PrintString service into a7.
	la a0, str1		# Load str1 address into a0.
	ecall			# Print "Valores aceitos" into the screen.
	j end			# Jump to the end of the program.

not_accepted:
	li a7, 4		# Load the PrintString service into a7.
	la a0, str2		# Load str2 address into a0.
	ecall			# Print "Valores aceitos" into the screen.

end:
	li a7, 10		# Load the Exit service into a7.
	ecall			# Exit the program.
