# C Code:
# int i = 1, j = 1, f = 2, g = 3, h = 2
#
# if (i==j)
#	f = g+h;
# f = f - i
#

# s0 = i; s1 = j; s2 = f; s3 = g; s4 = h

# initialize values.
addi s0, zero, 1
addi s1, zero, 2
addi s2, zero, 2
addi s3, zero, 3
addi s4, zero, 2

bne s0, s1, L1 			# if (i != j) branch to L1
	add s2, s3, s4		# inside if statement, f = g+h

L1:				# if label
	sub s2, s2, s0		# outside if, f = f - i