# Zachary Thompson
# Assignment 2
# addition.asm

.data
.text
.globl main
main:
	li  $8, 146         # load 146 into $8
	li  $9, -82         # load -82 into $9
	add $10, $8, $9     # add the numbers and store them into $10

	# Syscall to exit the program
	li  $v0, 10        # code 10 == exit
	syscall            # execute exit syscall
.end

