#; factorial

#; text messages
    .data
msg1: .asciiz "Enter number: "
out1: .asciiz "\nFactorial is: "
    
    .text
main:

    #; read first number
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 1
    li $t2, 1
loop:
    bgt $t2, $t0, end     #; greater than or 
    mul $t1, $t1, $t2   #; multiplication
    add $t2, $t2, 1    #; increment
    j loop              #; jumt to loop

end:
    li $v0, 4
    la $a0, out1
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    jr $ra