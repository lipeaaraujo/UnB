# s0 = base address, s1 = i, t0 = 1000

lui s0, 0x00000
addi s0, s0, 0x000
add s1, zero, zero
addi t0, t0, 1000	# used for iteration
add t1, t1, s0		# used for iteration

loop:
	bgt s1, t0, done	# branch if s1 > 1000.
	lw t2, 0(t1)		# t2 = array[i]
	slli t2, t2, 3		# array[i] *= 8
	sw t2, 0(t1)		# array[i] = t1
	addi t1, t1, 4		# t1 = t1 + 4, used for moving base address.
	addi t0, t0, 1		# t0++
	j	loop		# jump for the loop
	
done: