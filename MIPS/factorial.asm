#; factorial.asm
#; calculates the factorial of a non-negative integer provided by the user (recursive approach)

.data
prompt: .asciiz "Enter a non-negative integer: \n"
result_msg: .asciiz "The factorial is: "

.text
main:
# print prompt
li $v0, 4
la $a0, prompt
syscall

# read integer
li $v0, 5
syscall
move $a0, $v0 # move input to $a0 for factorial function
jal factorial # call factorial function
move $t0, $v0 # move result to $t0

# print result message
li $v0, 4
la $a0, result_msg
syscall

# print factorial result
li $v0, 1
move $a0, $t0
syscall

# exit program
li $v0, 10
syscall

# factorial function
# input: $a0 = n
# output: $v0 = n!

factorial:
# base case: if n == 0, return 1
beqz $a0, base_case
addi $sp, $sp, -8 # allocate stack space
sw $ra, 4($sp)    # save return address
sw $a0, 0($sp)    # save n
addi $a0, $a0, -1 # n - 1
jal factorial      # recursive call
lw $a0, 0($sp)    # restore n
mul $v0, $v0, $a0 # n * factorial(n - 1)
lw $ra, 4($sp)    # restore return address
addi $sp, $sp, 8  # deallocate stack space
jr $ra            # return

base_case:
li $v0, 1         # return 1 for 0!
jr $ra            # return

