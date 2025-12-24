#; array_average.asm
#; Calculates the average of 5 integers defined in .data

.data
array: .word 10, 20, 30, 40, 50
count: .word 5
prompt_msg: .asciiz "The average is: \n"
newline: .asciiz "\n"

.text
main:
la $t0, array
lw $t1, count
li $t2, 0          # sum initialized to 0
li $t3, 0          # index initialized to 0

sum_loop:
beq $t3, $t1, calculate_average
lw $t4, 0($t0)    # load current array element
add $t2, $t2, $t4 # add to sum
addi $t0, $t0, 4  # move to next element
addi $t3, $t3, 1  # increment index
j sum_loop

calculate_average:
div $t2, $t1      # divide sum by count
mflo $t5          # move quotient (average) to $t5
mfhi $t6          # move remainder to $t6

# print prompt message
li $v0, 4
la $a0, prompt_msg
syscall

# print average
li $v0, 1
move $a0, $t5
syscall

# print remainder (if any)
bnez $t6, print_remainder
j end

print_remainder:
li $v0, 4
la $a0, newline
syscall

li $v0, 1
move $a0, $t6
syscall

end:
# exit program
li $v0, 10
syscall
