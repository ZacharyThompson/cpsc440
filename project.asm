# Zachary Thompson
# Final Project
# project.asm

.data

answer: .word 0x55

plus: .ascii "+"
minus: .ascii "-"
multiply: .ascii "*"
divide: .ascii "/"

# Declare 64 bytes of space for the input string
buffer: .space 64

.text
.globl main
main:
# Read Input String
	la $a0, buffer
	li $a1, 64
	li $v0, 8
	syscall

# Load 1st digit
	la $t0, buffer
	lb $s1, ($t0)
	sub $s1, $s1, 0x30
loop:
# Point to the next byte
	add $t0, $t0, 1
# Load Operator
	lb $s2, ($t0)
	
# Check for the end of the input
# 0xa = \n 
	beq $s2, 0xa, end_loop

# Point to the next byte
	add $t0, $t0, 1
# Load Digit
	lb $s3, ($t0)
	sub $s3, $s3, 0x30

# Determine which operation to do
	lb $s0, plus
	beq $s0, $s2, add_op

	lb $s0, minus
	beq $s0, $s2, sub_op

	lb $s0, multiply
	beq $s0, $s2, mul_op

	lb $s0, divide
	beq $s0, $s2, div_op

	j end_loop

add_op:
	add $s1, $s1, $s3
	j loop
sub_op:
	sub $s1, $s1, $s3
	j loop
mul_op:
	mul $s1, $s1, $s3
	j loop
div_op:
	div $s1, $s1, $s3
	j loop

end_loop:
	sw $s1, answer
	lw $a0, answer
	li $v0, 1
	syscall

exit:
# Exit Program Syscall
	li $v0, 10
	syscall
.end

