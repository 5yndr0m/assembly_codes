#; element_frequency.asm
#; Counts the frequency of element(5) in an predefined array

.data
array: .word 1, 5, 3, 5, 7, 5, 9, 2, 5, 4
count: .word 10
target: .word 5
prompt_msg: .asciiz "The frequency of the element is: \n"

.text
main:
la $t0, array        # Load address of the array
lw $t1, count       # Load the count of elements
lw $t2, target      # Load the target element to count
li $t3, 0           # Initialize frequency count to 0
li $t4, 0           # Initialize index to 0
frequency_loop:
beq $t4, $t1, print_frequency # If index == count, exit
lw $t5, 0($t0)     # Load current array element
beq $t5, $t2, increment_count # If element == target, increment count
j continue_loop

increment_count:
addi $t3, $t3, 1   # Increment frequency count
continue_loop:
addi $t0, $t0, 4   # Move to next element
addi $t4, $t4, 1   # Increment index
j frequency_loop

print_frequency:
# Print prompt message
li $v0, 4
la $a0, prompt_msg
syscall

# Print frequency count
li $v0, 1
move $a0, $t3
syscall

# Exit program
li $v0, 10
syscall

