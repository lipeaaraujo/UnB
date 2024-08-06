# s0 = base address, s1 = len
lui s0, 0x00000
addi s0, s0, 0x000
add s1, zero, zero
add t0, zero, s0

loop:
	beq t1, zero, done	# Break the loop if the character is null.
	lw t1, 0(t0)
	addi t0, t0, 1
	addi s1, s1, 1
	j loop
done: