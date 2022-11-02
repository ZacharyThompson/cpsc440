# Zachary Thompson
# Assignment 4
# average.asm

.data
N:	.word 5
X:	.byte 12
	.byte 97
	.byte 133
	.byte 82
	.byte 236

average: .word 0

.text
.globl main
main:
	li $s0, 0 # set $s0 (sum) to zero
	la $t0, X # Address of array is stored in $t0
	lw $s1, N # Loop Counter is stored in $s1

loop:
	li $t1, 0          # Set $t1 to zero
	lbu $t1, 0($t0)    # Load next value in the array. Interpret as unsigned.
	addu $s0, $s0, $t1 # Add it to $s0
	addi $t0, $t0, 1   # Point to next item in the array
	addi $s1, $s1, -1  # Decrement loop counter
	bne $0, $s1, loop  # Loop until loop counter is 0
# End of loop

	div $s0, $s0, 5 # Divide the sum by 5 to get the average
	sw $s0, average # Store average in memory


	# Syscall to exit the program
	li  $v0, 10        # code 10 == exit
	syscall            # execute exit syscall
.end
