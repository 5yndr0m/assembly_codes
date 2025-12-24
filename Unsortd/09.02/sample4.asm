    #; sample4.asm
    #; print string - "Hello World"
    .text
main:
    #; apply syscall code 4 to $v0 (print string)
    #; put the string address into $a0
    li $v0, 4
    la $a0, msg1
    syscall

    jr $ra

.data
msg1: .ascii "Hello World"