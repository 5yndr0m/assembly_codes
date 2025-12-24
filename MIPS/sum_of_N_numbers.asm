#; sum_of_N_numbers.asm
#; Sums N integers provided by the user

.data
prompt_n: .asciiz "Enter the number of integers to sum: \n"
prompt_num: .asciiz "Enter an integer: \n"
result_msg: .asciiz "The sum is: "

.text
main:
# prompt for number of integers
li $v0, 4
la $a0, prompt_n
syscall

# read number of integers
li $v0, 5
syscall
move $t0, $v0

li $t1, 0 # sum initialized to 0
li $t2, 0 # counter initialized to 0

sum_loop:
beq $t2, $t0, print_result

# prompt for integer
li $v0, 4
la $a0, prompt_num
syscall

# read integer
li $v0, 5
syscall
add $t1, $t1, $v0
addi $t2, $t2, 1

j sum_loop

print_result:
# print result message
li $v0, 4
la $a0, result_msg
syscall

# print sum
li $v0, 1
move $a0, $t1
syscall

# exit program
li $v0, 10
syscall
