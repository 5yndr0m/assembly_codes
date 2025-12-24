#; readNumber.asm
#; read 2 numbers rom user and print

#; text messages
    .data
msg1: .asciiz "Enter first number: "
msg2: .asciiz "Enter second number: "
out1: .asciiz "You entered: "
out2: .asciiz " and "
out3: .asciiz "\nTotal is: "
    
    .text
main:

    #; read first number
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    #; read second number
    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0

    #; print numbers entered by user
    li $v0, 4
    la $a0, out1
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, out2
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 4
    la $a0, out3
    syscall

    add $t2, $t0, $t1

    li $v0, 1
    move $a0, $t2
    syscall

    jr $ra