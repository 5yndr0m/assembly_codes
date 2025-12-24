#; linear_search.asm
#; Performs a linear search for a target value in an array

.data
array: .word 10, 23, 45, 67, 89, 12, 34, 56, 78, 90
count: .word 10
prompt_target: .asciiz "Enter the target value to search for: \n"
found_msg: .asciiz "Target found at index: "
not_found_msg: .asciiz "Target not found in the array.\n"

.text
main:
# print prompt for target value
li $v0, 4
la $a0, prompt_target
syscall

# read target value
li $v0, 5
syscall
move $t0, $v0       # target value in $t0

la $t1, array      # load address of array
lw $t2, count      # load number of elements
li $t3, 0          # index initialized to 0
li $t4, -1         # result index initialized to -1 (not found)

search_loop:
beq $t3, $t2, print_result # if index == count, go to print_result
lw $t5, 0($t1)    # load current array element

beq $t5, $t0, found_target # if element == target, go to found_target
addi $t1, $t1, 4 # move to next element
addi $t3, $t3, 1 # increment index
j search_loop

found_target:
move $t4, $t3     # store found index in $t4
j print_result

print_result:
bne $t4, -1, print_found

# print not found message
li $v0, 4
la $a0, not_found_msg
syscall
j end

print_found:
# print found message
li $v0, 4
la $a0, found_msg
syscall

# print found index
li $v0, 1
move $a0, $t4
syscall

end:
# exit program
li $v0, 10
syscall
