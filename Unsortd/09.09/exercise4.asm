#;exercise2
#;(a+b)-b
.text
main:
	li $t0,2
	li $t1,3
	li $t2,5
	
	add $t3,$t0,$t1
	sub $t4,$t3,$t1
	
	li $v0, 1
    move $a0, $t4
    syscall
	
	jr $ra