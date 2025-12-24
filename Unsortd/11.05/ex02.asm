#; ex02
#; (a + b) + c
#; a = 2, b = 3, c = 5

    .text
main:

    li $t0, 2
    li $t1, 3

    add $t1, $t0, $t1

    li $t0, 5
    add $t1, $t1, $t0

    li $v0, 1
    move $a0, $t1
    syscall

    jr $ra