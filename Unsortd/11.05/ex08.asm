#; ex02
#; a * (a + b) * c

    .text
main:

    li $t0, 2
    li $t1, 3

    add $t1, $t0, $t1
    mult $t0, $t1
    mflo $t0

    li $t1, 5
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