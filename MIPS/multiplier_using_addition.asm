#; The "Multiplier" without mul
#; Scenario: Some older MIPS processors do not have a hardware multiplier. 
#; You need to simulate multiplication using addition.
#; Task: Ask the user for two positive integers, A and B.
#; Requirement: Calculate A×B by adding A to a running total B times (a simple for loop).
#; Challenge: You must handle the case where the user enters 0. 
#; If B is 0, the loop should not execute, and the result should be 0.
#; Bonus: Use the stack ($sp) to save the result before printing it, just to practice stack operations.

.data
prompt_num1: .asciiz "Enter first positive integer (A): \n"
prompt_num2: .asciiz "Enter second positive integer (B): \n"
result_msg: .asciiz "The result of A x B is: \n"

.text
main:
#; prompt for first number
li $v0, 4
la $a0, prompt_num1
syscall

#; read first integer
li $v0, 5
syscall
move $t0, $v0

#; prompt for second number
li $v0, 4
la $a0, prompt_num2
syscall

#; read second integer
li $v0, 5
syscall
move $t1, $v0

li $t2, 0  #; result initialized to 0
li $t3, 0  #; counter initialized to 0

#; check if B (in $t1) is 0
beqz $t1, skip_multiplication

#; multiplication loop
multiply_loop:
beq $t3, $t1, end_multiplication
add $t2, $t2, $t0
addi $t3, $t3, 1
j multiply_loop

end_multiplication:

#; skip multiplication if B is 0
skip_multiplication:

#; push result onto stack
addi $sp, $sp, -4
sw $t2, 0($sp)

#; print result message
li $v0, 4
la $a0, result_msg
syscall

#; pop result from stack
lw $t2, 0($sp)
addi $sp, $sp, 4

#; print result
li $v0, 1
move $a0, $t2
syscall

#; exit program
li $v0, 10
syscall

