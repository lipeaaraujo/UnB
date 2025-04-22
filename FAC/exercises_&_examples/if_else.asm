# if-else statement

# if (i == j) {
# 	i += j;
# } else {
#	j++;
# }

# i = s0, j = s1

bne s0, s1, L1
	add s0, s0, s1
	j   done
L1:
	addi s1, s1, 1
done: