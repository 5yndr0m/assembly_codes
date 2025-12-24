#;addfloat.asm
#;Adding 2 float values

.text
main:

	li.s $t0,2.5	
	li.s $t1,3.6
	
	add.s $t2, $t0, $t1
	
	li.s $v0, 2        
    move.s $a0, $t2       
    syscall
	
	jr $ra