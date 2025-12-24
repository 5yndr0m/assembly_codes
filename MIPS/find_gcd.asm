#; find_gcd.asm
#; compute the GCD of two positive integers
#; use Euclid's algorithm

        .data
msg1: .asciiz "Enter first positive integer: "
msg2: .asciiz "Enter second positive integer: "
out1: .asciiz "The GCD is: "
newline: .asciiz "\n"

        .text
main:
        #; print msg1 
        li $v0, 4
        la $a0, msg1
        syscall

        #; read first integer
        li $v0, 5
        syscall
        move $t0, $v0

        #; print msg2
        li $v0, 4
        la $a0, msg2
        syscall

        #; read second integer
        li $v0, 5
        syscall
        move $t1, $v0

        #; if $t0 == 0, check $t1
        beq $t0, $zero, handle_a_zero

        #; if $t1 == 0, return $t0
        beq $t1, $zero, handle_b_zero

gcd_loop:
        #; while b != 0
        beq $t1, $zero, done #; if b == 0, done

        #; compute reminder: r = a % b
        div $t0, $t1
        mfhi $t2
        move $t0, $t1
        move $t1, $t2
        j gcd_loop

handle_a_zero:
        #; if a == 0, return b
        move $t0, $t1
        j done

handle_b_zero:
        #; if b == 0, return a
        j done

done:
        #; print result message
        li $v0, 4
        la $a0, out1
        syscall

        #; print GCD result
        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 4
        la $a0, newline
        syscall

        li $v0, 10
        syscall
