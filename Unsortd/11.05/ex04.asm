#; ex02
#; (a + b) - b
#; a = 2, b = 3

    .text
main:

    li $t0, 2
    li $t1, 3
    add $t0, $t0, $t1

    sub $t1, $t0, $t1

    li $v0, 1
    move $a0, $t1
    syscall

    jr $ra