# Zachary Thompson
# slope.asm

.data

welcome_msg: .asciiz "Welcome to Slope of Line Calculator\nEnter 2 points:\n"
x1_msg: .asciiz "Enter x1: "
y1_msg: .asciiz "Enter y1: "
x2_msg: .asciiz "Enter x2: "
y2_msg: .asciiz "Enter y2: "

end_msg: .asciiz "The slope of this line is: "
answer: .double 0.0

.text
.globl main
main:
	# Print welcome_message
	li $v0, 4
	la $a0, welcome_msg
	syscall

	# Print x1_msg
	li $v0, 4
	la $a0, x1_msg
	syscall
	# Read x1 from user input
	li $v0, 7
	syscall
	mov.d $f2, $f0

	# Print y1_msg
	li $v0, 4
	la $a0, y1_msg
	syscall
	# Read y1 from user input
	li $v0, 7
	syscall
	mov.d $f4, $f0
	
	# Print x2_msg
	li $v0, 4
	la $a0, x2_msg
	syscall
	# Read x2 from user input
	li $v0, 7
	syscall
	mov.d $f6, $f0

	# Print y2_msg
	li $v0, 4
	la $a0, y2_msg
	syscall
	# Read y2 from user input
	li $v0, 7
	syscall
	mov.d $f8, $f0

	# y2 - y1
	sub.d $f10, $f8, $f4
	# x2 - x1
	sub.d $f12, $f6, $f2
	# (y2-y1) / (x2-x1)
	div.d $f14, $f10, $f12

    # Store slope in memory
	s.d $f14, answer

	# Print end_msg
	li $v0, 4
	la $a0, end_msg
	syscall

    # Print the slope
	li $v0, 3
	l.d $f12, answer
	syscall

	# Exit Program Syscall
	li $v0, 10
	syscall
.end

