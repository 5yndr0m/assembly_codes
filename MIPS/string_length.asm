#; string_length.asm
#; read a string from user and print its length(excluding null terminator/ newline)

.data
prompt: .asciiz "Enter a string: \n"
length_msg: .asciiz "The length of the string is: "
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

# calculate length
la $t0, string_buffer # load address of string
li $t1, 0             # length counter

length_loop:
lb $t2, 0($t0)        # load byte from string
beqz $t2, length_done # if null terminator, end loop
beq $t2, 10, length_done # if newline, end loop
addi $t1, $t1, 1      # increment length counter
addi $t0, $t0, 1      # move to next character
j length_loop

length_done:
# print length message
li $v0, 4
la $a0, length_msg
syscall

# print length
li $v0, 1
move $a0, $t1
syscall

# exit program
li $v0, 10
syscall
