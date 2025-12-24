#; The "Password" Length Validator
#; Scenario: You are building a simple security module. The program must ask the user to input a string (the password).
#; Task: Count the number of characters in the string.
#; Requirement: If the string is shorter than 8 characters, print "Weak Password". 
#; If it is 8 characters or longer, print "Strong Password".
#; Challenge: Remember that syscall 8 includes the newline character \n (ASCII 10) in the count 
#;if there is space in the buffer. You must handle or subtract this to get the true length.

.data
prompt: .asciiz "Enter your password: \n"
weak_msg: .asciiz "Weak Password\n"
strong_msg: .asciiz "Strong Password\n"
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
la $t0, string_buffer
li $t1, 0             # length counter

length_loop:
lb $t2, 0($t0)
beqz $t2, length_done
beq $t2, 10, length_done
addi $t1, $t1, 1
addi $t0, $t0, 1
j length_loop

length_done:
# check password strength
li $t3, 8
blt $t1, $t3, print_weak_password

# print strong password message
li $v0, 4
la $a0, strong_msg
syscall
j exit_program

print_weak_password:
# print weak password message
li $v0, 4
la $a0, weak_msg
syscall

exit_program:
# exit program
li $v0, 10
syscall
