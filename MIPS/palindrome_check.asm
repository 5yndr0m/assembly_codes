#; palindrome_check.asm
#; Checks if a user enterd string is a palindrome

.data
prompt: .asciiz "Enter a string: \n"
palindrome_msg: .asciiz "The string is a palindrome.\n"
not_palindrome_msg: .asciiz "The string is not a palindrome.\n"
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
# check palindrome
la $t3, string_buffer # start pointer
add $t4, $t3, $t1    # end pointer (points to null terminator)
addi $t4, $t4, -1     # move to last

li $t5, 1             # assume palindrome

palindrome_check_loop:
bge $t3, $t4, palindrome_done # if start >= end, done
lb $t6, 0($t3)        # load start character
lb $t7, 0($t4)        # load end character
bne $t6, $t7, not_palindrome # if not equal, not palindrome
addi $t3, $t3, 1      # move start forward
addi $t4, $t4, -1     # move end backward
j palindrome_check_loop

not_palindrome:
li $t5, 0             # not a palindrome
j palindrome_done

palindrome_done:
# print result
beqz $t5, print_not_palindrome
# print palindrome message
li $v0, 4
la $a0, palindrome_msg
syscall
j end

print_not_palindrome:
# print not palindrome message
li $v0, 4
la $a0, not_palindrome_msg
syscall

end:
# exit program
li $v0, 10
syscall
