#; ex02
#; 5 / 2

    .text
main:

    li $t0, 5
    li $t1, 2
    div $t0, $t1

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    mflo $a0
    syscall

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 1
    mfhi $a0
    syscall

    jr $ra

    .data
msg1: .asciiz "Result: "
msg2: .asciiz "\nRemainder: "