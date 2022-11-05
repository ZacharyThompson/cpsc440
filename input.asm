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
	li $v0, 7
	syscall
	mov.d $f2, $f0

	# Print msg_2
	li $v0, 4
	la $a0, msg_2
	syscall
	# Read Number 2
	li $v0, 7
	syscall
	mov.d $f4, $f0

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
	add.d $f6, $f2, $f4
	j print_answer
sub_op:
	sub.d $f6, $f2, $f4
	j print_answer
mul_op:
	mul.d $f6, $f2, $f4
	j print_answer
div_op:
	div.d $f6, $f2, $f4
	j print_answer

print_answer:
	# Print newline
	li $v0, 4
	la $a0, newline
	syscall

	# Print Number 1
	mov.d $f12, $f2
	li $v0, 3
	syscall

	# Print Operation
	li $v0, 11
	move $a0, $s1
	syscall

	# Print Number 2
	mov.d $f12, $f4
	li $v0, 3
	syscall

	# Print =
	la $a0, 0x3D
	li $v0, 11
	syscall

	# Print Answer
	mov.d $f12, $f6
	li $v0, 3
	syscall

exit:
	# Exit Program Syscall
	li $v0, 10
	syscall
.end


