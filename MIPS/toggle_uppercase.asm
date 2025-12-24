#; toggle_uppercase.asm
#; read a string from user and toggle the case of each letter to uppercase if lowercase. no change for uppercase or non-alphabetic characters

.data
prompt: .asciiz "Enter a string: \n"
result_msg: .asciiz "Toggled string: \n"
string_buffer: .space 100

.text
main:
# print prompt
li $v0, 4
la $a0, prompt
syscall

# read string
li $v0, 8
la $a0, string_buffer
li $a1, 100
syscall

# toggle case
la $t0, string_buffer # load address of string
li $t1, 0             # index counter

toggle_loop:
lb $t2, 0($t0)        # load byte from string
beqz $t2, toggle_done # if null terminator, end loop
beq $t2, 10, toggle_done # if newline, end loop

# check if lowercase letter
li $t3, 'a'
li $t4, 'z'
blt $t2, $t3, not_lowercase
bgt $t2, $t4, not_lowercase

# convert to uppercase
sub $t2, $t2, 32
sb $t2, 0($t0)        # store modified byte
j continue_loop

not_lowercase:
# no change for uppercase or non-alphabetic characters
sb $t2, 0($t0)        # store original byte

continue_loop:
addi $t0, $t0, 1      # move to next character
j toggle_loop

toggle_done:
# print result message
li $v0, 4
la $a0, result_msg
syscall

# print toggled string
li $v0, 4
la $a0, string_buffer
syscall

# exit program
li $v0, 10
syscall
