#; power_function.asm
#; Computes base^exponent for non-negative integer exponent using a function(power(base, exponent))

.data
prompt_base: .asciiz "Enter the base (integer): \n"
prompt_exponent: .asciiz "Enter the exponent (non-negative integer): \n"
result_msg: .asciiz "The result is: "

.text
main:
# print prompt for base
li $v0, 4
la $a0, prompt_base
syscall

# read base
li $v0, 5
syscall
move $t0, $v0 # move base to $t0

# print prompt for exponent
li $v0, 4
la $a0, prompt_exponent
syscall

# read exponent
li $v0, 5
syscall
move $a0, $t0 # move base to $a0
move $a1, $v0 # move exponent to $a1
jal power      # call power function
move $t1, $v0 # move result to $t1

# print result message
li $v0, 4
la $a0, result_msg
syscall

# print result
li $v0, 1
move $a0, $t1
syscall

# exit program
li $v0, 10
syscall

# power function
# input: $a0 = base, $a1 = exponent
# output: $v0 = base^exponent
power:
# base case: if exponent == 0, return 1
beqz $a1, base_case_power
addi $sp, $sp, -8 # allocate stack space
sw $ra, 4($sp)    # save return address
sw $a0, 0($sp)    # save base
addi $a1, $a1, -1 # exponent - 1
jal power         # recursive call
lw $a0, 0($sp)    # restore base
mul $v0, $v0, $a0 # base * power(base, exponent - 1)
lw $ra, 4($sp)    # restore return address
addi $sp, $sp, 8  # deallocate stack space
jr $ra            # return

base_case_power:
li $v0, 1         # return 1 for base^0
jr $ra            # return

