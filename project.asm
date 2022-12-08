# Zachary Thompson
# Final Project
# project.asm

.data

msg_1:		.ascii "Welcome to one digit integer calculator.\n"
			.ascii "This calculator does not follow PEMDAS order of operations.\n"
			.ascii "The valid operations are : +,-,*,/\n"
			.asciiz "Enter an expression such as \"5/3+4-7*8\": "

msg_2: 		.asciiz "\nThe answer is: "

error_msg: 	.asciiz "\nThere was an error with the input"

answer:		.word 0x55

plus:		.ascii "+"
minus:		.ascii "-"
multiply:	.ascii "*"
divide:		.ascii "/"

# Declare 256 bytes of space for the input string
buffer:	.space 256

.text
.globl main
main:
	# Print msg_1
	la $a0, msg_1
	li $v0, 4
	syscall

	# Read Input String
	la $a0, buffer
	li $a1, 64
	li $v0, 8
	syscall

	# Load 1st digit
	la $t0, buffer
	lb $s1, ($t0)
	sub $s1, $s1, 0x30
	bgtu $s1, 9, error

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
	bgtu $s3, 9, error

	# Determine which operation to do
	lb $s0, plus
	beq $s0, $s2, add_op

	lb $s0, minus
	beq $s0, $s2, sub_op

	lb $s0, multiply
	beq $s0, $s2, mul_op

	lb $s0, divide
	beq $s0, $s2, div_op

	# If the program reaches this point, there was no operator match
	# meaning there was an error in the input
	j error

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
	# Print msg_2
	la $a0, msg_2
	li $v0, 4
	syscall

	sw $s1, answer
	lw $a0, answer
	li $v0, 1
	syscall

exit:
	# Exit Program Syscall
	li $v0, 10
	syscall

error:
	# Print error message
	la $a0, error_msg
	li $v0, 4
	syscall

	j exit

.end

