#;addfloat.asm
#;Adding 2 float values

.text
main:

	li.s $f0,2.5	
	li.s $f1,3.6
	
	add.s $f2, $f0, $f1
   
    mov.s $f12, $f2
	
	li $v0,2
	syscall
	
	jr $ra