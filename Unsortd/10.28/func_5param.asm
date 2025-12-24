#; function with 5 param

.text
	
main:
	#; main function

	addi $sp, $sp, -8	#; allocate space
	sw $ra, 0($sp)
	
	li $t0, 10			#; x = 10 | assumes x is t0
	li $t1, 20			#; y = 20 | assumes y is t1
	li $t2, 20			#; a = 20 | assumes a is t2
	li $t3, 10			#; b = 10 | assumes b is t3
	li $t4, 10			#; m = 10 | assumes m is t4
	
	#; function call
	move $a0, $t0		#; copy argument to a0 | x
	move $a1, $t1		#; copy argument to a1 | y
	move $a2, $t2		#; copy argument to a2 | a
	move $a3, $t3		#; copy argument to a3 | b
	
	sw $t4, 4($sp)		#; store
	
	jal inc				#; jump to function inc | it stores answer in v0
	
	move $t0, $v0		#; copy from v0 to t0 
	
	#; print x
	li $v0, 1
	move $a0, $t0
	syscall
	
	lw $ra, 0($sp)
	
	addi $sp, $sp, 4	#; release space

	jr $ra
	
inc:
	add $a0, $a1, $a0	#; x = y + x
	add $a2, $a3, $a2	#; a = b + a
	add $a0, $a2, $a0	#; x = a + x
	
	lw $t1, 4($sp)		#; load 5th parameter
	add $a0, $t1, $a0	#; x = m + x
	
	move $v0, $a0		#; save answer to v0

	jr $ra