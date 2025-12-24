#; Integer Array "Sort and Median"
#; Scenario: You are given an unsorted array of exactly 9 integers in the `.data` section.
#: The Task: Implement a simple **Bubble Sort** (or Selection Sort) to sort the array in ascending order.
#; The Goal: After sorting, identify and print the **median** value (the middle element, which will be at index 4).
#; Key Requirements: * Use nested loops (an outer loop for passes, an inner loop for comparisons). 
#; Use `lw` and `sw` to swap elements in memory.

.data
array: .word 34, 12, 5, 67, 23, 89, 1, 45, 78
count: .word 9
median_msg: .asciiz "The median value is: \n"

.text
main:
la $t0, array        # Load address of the array
lw $t1, count       # Load the count of elements
li $t2, 0           # Outer loop index i

outer_loop:
beq $t2, $t1, find_median # If i == count, go to find_median
li $t3, 0           # Inner loop index j
addi $t4, $t1, -1   # Set limit for inner loop (count - 1)
sub $t4, $t4, $t2   # Adjust limit for current pass

inner_loop:
beq $t3, $t4, increment_outer # If j == limit, increment outer loop
sll $t5, $t3, 2      # Calculate offset for j
add $t6, $t0, $t5    # Address of array[j]
lw $t7, 0($t6)       # Load array[j]
addi $t8, $t3, 1     # j + 1
sll $t9, $t8, 2      # Calculate offset for j + 1
add $s0, $t0, $t9    # Address of array[j + 1]
lw $s1, 0($s0)       # Load array[j + 1]
bgt $t7, $s1, swap_elements # If array[j] > array[j + 1], swap
j continue_inner

swap_elements:
sw $s1, 0($t6)       # Store array[j + 1] at array[j]
sw $t7, 0($s0)       # Store array[j] at array[j + 1]
continue_inner:
addi $t3, $t3, 1     # Increment inner loop index j
j inner_loop

increment_outer:
addi $t2, $t2, 1     # Increment outer loop index i
j outer_loop

find_median:
la $t0, array        # Reload address of the array
addi $t5, $t0, 16    # Address of the median element (index 4)
lw $t6, 0($t5)       # Load median value

# Print median message
li $v0, 4
la $a0, median_msg
syscall

# Print median value
li $v0, 1
move $a0, $t6
syscall

# Exit program
li $v0, 10
syscall
