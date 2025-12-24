#;exercise2
#;(a+b)+(c+a)
.text
main:
	li $t0,2 #;a
	li $t1,3 #;b
	li $t2,5 #;c
	
	add $t3,$t0,$t1
	add $t4,$t2,$t0
	add $t5,$t4,$t3
	
	li $v0, 1
    move $a0, $t5
    syscall
	
	jr $ra