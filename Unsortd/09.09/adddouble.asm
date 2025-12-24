#;adddouble.asm
#;Adding 2 double values

.text
main:

	li.d $f0,2.5	
	li.d $f1,3.6
	
	add.d $f2, $f0, $f1
   
    mov.d $f12, $f2
	
	li $v0,3
	syscall
	
	jr $ra