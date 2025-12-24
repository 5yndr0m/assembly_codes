#; ex02
#; 5 8 2

    .text
main:

    li $t0, 5
    li $t1, 2
    mult $t0, $t1

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 1
    mflo $a0
    syscall

    jr $ra

    .data
msg1: .asciiz "Result: "