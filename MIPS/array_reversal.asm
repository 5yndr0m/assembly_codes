#; array_reversal.asm
#; Define an array of integers and reverse its elements in-place (swapping elements from the ends toward the middle) and then prints the modified array.

.data
array: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
count: .word 10
prompt_msg: .asciiz "The reversed array is: \n"

.text
main:
la $t0, array        # Load address of the array
lw $t1, count       # Load the count of elements
addi $t2, $t1, -1   # Set end index (count - 1)
li $t3, 0           # Set start index to 0

reverse_loop:
bge $t3, $t2, print_array # If start index >= end index, exit loop
lw $t4, 0($t0)        # Load element at start index
lw $t5, 0($t0)       # Load element at end index
addi $t6, $t0, 4     # Calculate address of next element
addi $t7, $t0, 4     # Calculate address of next element
sll $t8, $t2, 2      # Calculate offset for end index
add $t9, $t0, $t8    # Address of end index element
lw $t5, 0($t9)       # Load element at end index
sw $t5, 0($t0)      # Store end element at start index
sw $t4, 0($t9)      # Store start element at end index
addi $t0, $t0, 4     # Move to next start index
addi $t2, $t2, -1    # Move to previous end index
addi $t3, $t3, 1     # Increment start index
j reverse_loop

print_array:
# Print prompt message
li $v0, 4
la $a0, prompt_msg
syscall

la $t0, array       # Load address of the array
lw $t1, count      # Load the count of elements
li $t3, 0          # Initialize index to 0

print_loop:
beq $t3, $t1, end  # If index == count, exit
lw $t4, 0($t0)     # Load current array element
# Print current element
li $v0, 1
move $a0, $t4
syscall

addi $t0, $t0, 4   # Move to next element
addi $t3, $t3, 1   # Increment index
j print_loop

end:
# Exit program
li $v0, 10
syscall
