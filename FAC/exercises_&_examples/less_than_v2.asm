# add the powers of 2 from 1 to 100
# sum = s0, i = s1

add s0, zero, zero	# s0 = 0
addi s1, zero, 1	# s1 = 1
addi t0, zero, 100	# t0 = 100

loop:
	bgt s1, t0, done	# if (s1 > 100) done
	add s0, s0, s1		# s0 = s0 + s1
	slli s1, s1, 1		# s1 = s1 * 2
	j loop			# jump back
done:
