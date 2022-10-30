# Zachary Thompson
# shiftleft.asm

.data
.text
.globl main
main:
	li  $8, 0x1A       # load 0x1A into $8
	sll $9, $8, 2      # shift the contents of $8 2 bits left and store result in $9

	# Syscall to exit the program
	li  $v0, 10        # code 10 == exit
	syscall            # execute exit syscall
.end


