#; ex09
#; read a string from user and print it

    .text
main:

    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 8
    la $a0, inmsg
    syscall

    li $v0, 4
    la $a0, msg2
    syscall

    li $v0, 4
    la $a0, inmsg
    syscall

    jr $ra

    .data
msg1: .asciiz "Enter a string: "
msg2: .asciiz "User entered: "
inmsg: .space 50
