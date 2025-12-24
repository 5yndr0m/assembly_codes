#; simple_calculator.asm
#; A simple calculator that performs addition, subtraction, multiplication, or division based on user input

.data
prompt_operation: .asciiz "Enter operation (+, -, *, /): \n"
prompt_num1: .asciiz "Enter first integer: \n"
prompt_num2: .asciiz "Enter second integer: \n"
result_msg: .asciiz "The result is: "
error_msg: .asciiz "Error: Division by zero is not allowed.\n"
newline: .asciiz "\n"

.text
main:
# prompt for operation
li $v0, 4
la $a0, prompt_operation
syscall

# read operation
li $v0, 12
syscall
move $t0, $v0

# prompt for first number
li $v0, 4
la $a0, prompt_num1
syscall

# read first integer
li $v0, 5
syscall
move $t1, $v0

# prompt for second number
li $v0, 4
la $a0, prompt_num2
syscall

# read second integer
li $v0, 5
syscall
move $t2, $v0

# perform operation
beq $t0, '+', addition
beq $t0, '-', subtract
beq $t0, '*', multiply
beq $t0, '/', divide
j end

addition:
add $t3, $t1, $t2
j print_result

subtract:
sub $t3, $t1, $t2
j print_result

multiply:
mul $t3, $t1, $t2
j print_result

divide:
beqz $t2, division_by_zero
div $t1, $t2
mflo $t3
j print_result

division_by_zero:
li $v0, 4
la $a0, error_msg
syscall
j end

print_result:
# print result message
li $v0, 4
la $a0, result_msg
syscall

# print result
li $v0, 1
move $a0, $t3
syscall

# print newline
li $v0, 4
la $a0, newline
syscall

end:
# exit program
li $v0, 10
syscall
