#;exercise2
#;(a+b)-(c+a)
.text
main:
	li $t0,2
	li $t1,3
	li $t2,5
	
	add $t3,$t0,$t1
	add $t4,$t2,$t0
	sub $t5,$t3,$t4
	
	li $v0, 1
    move $a0, $t5
    syscall
	
	jr $ra