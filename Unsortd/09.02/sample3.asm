    #; sample3.asm
    #; read 2 integers from user, add them and print the result integer
    .text
main:
    li $v0, 5           #; syscall code 5 -> read integer
    syscall             
    move $t0, $v0       #; move to $t0, the value read into $v0

    li $v0, 5
    syscall
    move $t1, $v0       #; move to $t1, the value read into $v0

    add $t2, $t0, $t1

    li $v0, 1
    move $a0, $t2
    syscall

    jr $ra 