#; ex02
#; (a + b) + (c + a)
#; a = 2, b = 3, c = 5

    .text
main:

    li $t0, 2
    li $t1, 3
    add $t1, $t0, $t1

    li $t2, 5
    add $t0, $t0, $t2
    add $t2, $t1, $t0

    li $v0, 1
    move $a0, $t2
    syscall

    jr $ra