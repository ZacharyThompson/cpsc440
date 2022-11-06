# Zachary Thompson
# Assignment 8
# input.asm

.data

msg_1: .asciiz "Enter Number 1: "
msg_2: .asciiz "Enter Number 2: "
msg_3: .asciiz "Enter an operation (+,-,*,/): "

plus: .asciiz "+"
minus: .asciiz "-"
multiply: .asciiz "*"
divide: .asciiz "/"
equals: .asciiz "="

newline: .asciiz "\n"

.text
.globl main
main:
	# Print msg_1
	li $v0, 4
	la $a0, msg_1
	syscall
	# Read Number 1
	li $v0, 5
	syscall
	move $s4, $v0

	# Print msg_2
	li $v0, 4
	la $a0, msg_2
	syscall
	# Read Number 2
	li $v0, 5
	syscall
	move $s5, $v0

	# Print msg_3
	li $v0, 4
	la $a0, msg_3
	syscall
	# Read operation character
	li $v0, 12
	syscall
	move $s1, $v0

	# Determine which operation to do
	la $t0, plus
	lb $s0, 0($t0)
	beq $s0, $s1, add_op
	lb $s0, minus
	beq $s0, $s1, sub_op
	lb $s0, multiply
	beq $s0, $s1, mul_op
	lb $s0, divide
	beq $s0, $s1, div_op

	# If it equals none, then exit
	j exit

add_op:
	add $s6, $s4, $s5
	j print_answer
sub_op:
	sub $s6, $s4, $s5
	j print_answer
mul_op:
	mul $s6, $s4, $s5
	j print_answer
div_op:
	div $s6, $s4, $s5
	j print_answer

print_answer:
	# Print newline
	li $v0, 4
	la $a0, newline
	syscall

	# Print Number 1
	move $a0, $s4
	li $v0, 1
	syscall

	# Print Operation
	li $v0, 11
	move $a0, $s1
	syscall

	# Print Number 2
	move $a0, $s5
	li $v0, 1
	syscall

	# Print =
	la $a0, 0x3D
	li $v0, 11
	syscall

	# Print Answer
	move $a0, $s6
	li $v0, 1
	syscall

exit:
	# Exit Program Syscall
	li $v0, 10
	syscall
.end
