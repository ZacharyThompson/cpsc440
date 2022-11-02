# Zachary Thompson
# Assignment 6
# sum.asm

.data
arr:     .byte 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
counter: .word 10
sum:     .word 0

.text
.globl main
main:
	la   $t0, arr      # Address of array is stored in $t0
	lw   $s1, counter  # Loop Counter is stored in $s1
	li   $t2, 0        # Store sum in $t2. Initial val is 0

loop:
	lb   $t1, 0($t0)   # Load number from array
	add  $t2, $t2, $t1 # Set it to lowercase
	addi $t0, $t0, 1   # Point to next number
	addi $s1, $s1, -1  # Decrement loop counter
	bne  $0, $s1, loop # Loop until loop counter is 0
# End of loop

	sw   $t2, sum      # Store sum in memory

	# Syscall to print integer
	li   $v0, 1        # code 1 == print int
	lw   $a0, sum      # $a0 == value of the integer
	syscall            # execute print_int syscall

	# Syscall to exit the program
	li   $v0, 10       # code 10 == exit
	syscall            # execute exit syscall
.end
