#; number_sign.asm
#; Determines if a number is positive, negative, or zero

.data
prompt: .asciiz "Enter an integer: \n"
positive_msg: .asciiz "The number is positive\n"
negative_msg: .asciiz "The number is negative\n"
zero_msg: .asciiz "The number is zero\n"

.text
main:
# print prompt
li $v0, 4
la $a0, prompt
syscall

# read integer
li $v0, 5
syscall
move $t0, $v0

# check sign
bgtz $t0, positive
bltz $t0, negative

# zero case
li $v0, 4
la $a0, zero_msg
syscall
j end

positive:
# positive case
li $v0, 4
la $a0, positive_msg
syscall
j end

negative:
# negative case
li $v0, 4
la $a0, negative_msg
syscall
j end

end:
# exit program
li $v0, 10
syscall


