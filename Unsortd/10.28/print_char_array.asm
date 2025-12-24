#; reading and printing an array of char

.data
string1:	.space 100	#; 100 bytes for storing char
newline:	.asciiz "\n"
.text
main:
	#; prompt fot user input
	li $v0, 8			
	la $a0, string1		#; for holding string
	li $a1, 100			#; allocated space
	syscall
	
	#; print the string back
	li $v0, 4
	la $a0, string1
	syscall
	
	#; print char by char
	
	move $t0, $a0		#; address of array to $t0
	
loop:
	lb $t1, 0($t0) 		#; load one char
	beq $t1, $zero, done
	
	li $v0, 11
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	add $t0, $t0, 1
	
	j loop
	
done:
	jr $ra