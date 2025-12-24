    #; sample2.asm
    #; adds two constants (5 + 15) and leave the result
    #; prints the result in the console
    .text
main: #; labels- used here for function name

    #; using li, pseudo instructions
    li $t0, 5           #; $t0 = 5
    li $t1, 15          #; $t1 = 15
    add $t2, $t0, $t1   #; $t2 = $t0 + $t1

    #; printing $t2(int) to the user (using a system call)
    #; assign the syscall code 1 (to print integer) to $v0
    #; $v0 is a special 
    #; put the integer to be printed in to $a0
    #; syscall
    li $v0, 1
    move $a0, $t2
    syscall

    jr $ra              #; return