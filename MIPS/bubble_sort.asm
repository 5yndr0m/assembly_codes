#; bubble_sort.asm

.data
array: .word 4, 2, 7, 9, 1, 5, 3, 8, 6, 0
count: .word 10
sorted_msg: .asciiz "The sorted array is: \n"

.text
main:
la $s0, array
lw $s1, count

outer_loop:
li $t0, 0
addi $s1, $s1, -1
blez $s1, print_array

inner_loop:
sll $t1, $t0, 2
add $t2, $s0, $t1

lw $t3, 0($t2)
lw $t4, 4($t2)

ble $t3, $t4, no_swap

sw $t4, 0($t2)
sw $t3, 4($t2)

no_swap:
addi $t0, $t0, 1
blt $t0, $s1, inner_loop
j outer_loop

print_array:
la $t0, array
lw $t1, count
li $t2, 0

li $v0, 4
la $a0, sorted_msg
syscall

print_loop:
beq $t2, $t1, end_program
lw $t3, 0($t0)
li $v0, 1
move $a0, $t3
syscall

addi $t0, $t0, 4
addi $t2, $t2, 1
j print_loop

end_program:
li $v0, 10
syscall
