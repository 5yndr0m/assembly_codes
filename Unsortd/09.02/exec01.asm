    #; exec01.asm 
    #; read 2 integers from user (Enter No x: )
    #; print the result (Result is: )
    .text
main:
    li $v0, 4           #; assign code 4 to $v0(print string)
    la $a0, msg1        #; assign address
    syscall

    li $v0, 5           #; assign code 5 to $v0(read integer)
    syscall
    move $t0, $v0       #; move value to $t0

    li $v0, 4           #; assign code 4 to $v0
    la $a0, msg2        #; assign address
    syscall

    li $v0, 5           #; assign code 5 to $v0
    syscall
    move $t1, $v0       #; move value to $t1

    add $t2, $t0, $t1   #; do addition

    li $v0, 4           #; assign code 4 to $v0
    la $a0, msg3        #; assign address
    syscall

    li $v0, 1           #; assign code 1 to $v0(print integer)
    move $a0, $t2       #; move value to $a0
    syscall

    jr $ra              #; return

    .data
msg1:   .asciiz "Enter No 1: "
msg2:   .asciiz "Enter No 2: "
msg3:   .asciiz "The summation is: "