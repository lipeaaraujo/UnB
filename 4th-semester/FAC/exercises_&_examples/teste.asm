	addi s0, zero,
	add s1, zero, zero
	addi t0, zero, 128
while:
	beq s0, t0, done
	slli s0, s0, 1
	addi s1, s1, 1
	j while
done:
