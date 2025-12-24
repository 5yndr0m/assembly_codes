#; ex01
#; add two floating point numbers

    .text
main:

    li.s $f0, 2.5
    li.s $f1, 3.5

    add.s $f2, $f0, $f1

    li $v0, 2
    mov.s $f12, $f2
    syscall

    jr $ra