#; The "Filter 5" Array Processor
#; Scenario: You are given a fixed array of 10 integers in the .data segment.
#; Task: Iterate through the array and calculate two things:
#; The sum of all numbers greater than 5.
#; The count of how many numbers were less than or equal to 5.
#; Requirement: Print both results with descriptive labels (e.g., "Sum: 45", "Count: 3").
#; Challenge: This tests your ability to use ble (branch if less than or equal) or bgt (branch if greater than) 
#; correctly within a loop.

.data
array: .word 3, 7, 2, 9, 5, 12, 4, 6, 1, 8
count: .word 10
sum_msg: .asciiz "Sum of numbers greater than 5: \n"
count_msg: .asciiz "\nCount of numbers less than or equal to 5: \n"

.text
main:
la $t0, array
lw $t1, count
li $t2, 0          # sum initialized to 0
li $t3, 0          # count initialized to 0
li $t4, 0          # index initialized to 0

loop:
beq $t4, $t1, print_results
lw $t5, 0($t0)
bgt $t5, 5, add_to_sum
addi $t3, $t3, 1
j continue_loop

add_to_sum:
add $t2, $t2, $t5

continue_loop:
addi $t0, $t0, 4
addi $t4, $t4, 1
j loop

print_results:
# Print sum message
li $v0, 4
la $a0, sum_msg
syscall

# Print sum
li $v0, 1
move $a0, $t2
syscall

# Print count message
li $v0, 4
la $a0, count_msg
syscall

# Print count
li $v0, 1
move $a0, $t3
syscall

# Exit program
li $v0, 10
syscall

