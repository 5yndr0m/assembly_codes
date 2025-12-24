#; readNumber.asm
#; read 2 numbers rom user and print

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
    
loop:
    ble $t0, 0, end     #; if less or equal jump to end
    mul $t1, $t1, $t0   #; multiplication
    add $t0, $t0, -1    #; decrement
    j loop              #; jumt to loop
end:

    li $v0, 1
    move $a0, $t1
    syscall

    jr $ra