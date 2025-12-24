#; parity_check.asm
#; Prints 1 if number is even, 0 if odd

.data
prompt: .asciiz "Enter an integer: "
even_msg: .asciiz "The number is even (1)\n"
odd_msg: .asciiz "Te number is odd (0)\n"

.text
main:

#print msg
li $v0, 4
la $a0, prompt
syscall

# read integer
li $v0, 5
syscall
move $t0, $v0

# check parity
andi $t1, $t0, 1
beqz $t1, even

# odd case
li $v0, 4
la $a0, odd_msg
syscall
j end

even:
# even case
li $v0, 4
la $a0, even_msg
syscall

end:
# exit program
li $v0, 10
syscall

