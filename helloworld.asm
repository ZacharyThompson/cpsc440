# Zachary Thompson
# helloworld.asm

.data
string: .asciiz "Hello World\n"

.text
.globl main
main:
	# Syscall to print string
	li  $v0, 4         # code 4 == print string
	la  $a0, string    # $a0 == address of the string
	syscall            # execute print_string syscall

	# Syscall to exit the program
	li  $v0, 10        # code 10 == exit
	syscall            # execute exit syscall
.end
