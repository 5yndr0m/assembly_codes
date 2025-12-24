#; fibonacci

     .data
msg1: .asciiz "Enter number: "
out1: .asciiz "Fibonacci sequence: "
out2: .asciiz "\nDone!"
spc1: .asciiz " "

     .text
main:

    li $t0, 0       #; first element
    li $t1, 1       #; second element
    li $t4, 0       #; cont

    #; print msg1
    li $v0, 4
    la $a0, msg1
    syscall

    #; read user input 
    li $v0, 5
    syscall
    move $t2, $v0       #; limit
    sub $t2, $t2, 2     #; subtract 2 from user input to add space to first 2 elements

    #; out msg1
    li $v0, 4
    la $a0, out1
    syscall

    #; print first element
    li $v0, 1
    move $a0, $t0
    syscall
    
loop:
    bgt $t4, $t2, end   #; loop grater than limit
    add $t4, $t4, 1     #; increment
    move $t3, $t1       #; move t0 to t3
    add $t1, $t1, $t0   #; add t1 and t0 save to t1
    move $t0, $t3       #; move t3 to t0
    
    li $v0, 4
    la $a0, spc1
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    
    j loop

end:
    li $v0, 4
    la $a0, out2
    syscall

    jr $ra