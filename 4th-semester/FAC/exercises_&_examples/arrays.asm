lui s0, 0x123B4		# 0x123B4 in the upper 20 bits.
addi s0, s0, 0x780	# 0x780 in the lower 12 bits.

lw t1, 0(s0)		# load array[0] into t1.
slli t1, t1, 1		# array[0] = array[0] * 2.
sw t1, 0(s0)		# array[0] = t1.

lw t1, 4(s0)		# load array[1] into t1.
slli t1, t1, 1		# array[1] = array[1] * 2.
sw t1, 4(s0)		# array[1] = t1.