#; find_maximum_from_array.asm
#; Finds the maximum value from an array of integers

.data
array: .word 34, 67, 23, 89, 12, 90, 45, 78, 56, 99
count: .word 10
prompt_msg: .asciiz "The maximum value is: \n"

.text
main:
la $t0, array
lw $t1, count

lw $t2, 0($t0)   # initialize max with the first element
addi $t0, $t0, 4 # move to the next element
li $t3, 1        # index initialized to 1

max_loop:
beq $t3, $t1, print_maximum
lw $t4, 0($t0)   # load current array element

bgt $t4, $t2, update_max
j continue_loop

update_max:
move $t2, $t4    # update max

continue_loop:
addi $t0, $t0, 4 # move to the next element
addi $t3, $t3, 1
j max_loop

print_maximum:
# print prompt message
li $v0, 4
la $a0, prompt_msg
syscall

# print maximum value
li $v0, 1
move $a0, $t2
syscall

# exit program
li $v0, 10
syscall
