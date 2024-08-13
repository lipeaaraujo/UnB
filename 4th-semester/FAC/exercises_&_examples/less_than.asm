# sum = s0, i = s1

add s0, zero, zero
add s1, zero, zero
addi t0, zero, 101

loop:
	bge s1, t0, done
	add s0, s0, s1
	addi s1, s1, 1
	j loop
done: