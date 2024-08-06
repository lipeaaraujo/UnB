# 2^x = 128

# pow = s0, x = s1

addi s0, zero, 1
add s1, zero, zero
addi t0, zero, 128

loop:
	beq s0, t0, done
	slli s0, s0, 1
	addi s1, s1, 1
	j loop
done: