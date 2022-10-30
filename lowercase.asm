# Zachary Thompson
# lowercase.asm

.data
string: .asciiz "ABCDEFG"
counter: .byte 7

.text
.globl main
main:
	la $t0, string # Address of string is stored in $t0
	lw $s1, counter # Loop Counter is stored in $s1

loop:
	lb $t1, 0($t0)    # Load character from the string
	addi $t1, $t1, 0x20 # Set it to lowercase
	sb $t1, 0($t0)     # Put lowercase letter in the string
	addi $t0, $t0, 1   # Point to next character
	addi $s1, $s1, -1  # Decrement loop counter
	bne $0, $s1, loop  # Loop until loop counter is 0
# End of loop

	# Syscall to exit the program
	li  $v0, 10        # code 10 == exit
	syscall            # execute exit syscall
.end

