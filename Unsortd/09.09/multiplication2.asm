#;multiplication2.asm
#;a*(a+b)*c
.text
main: 
    li $t0, 2           
    li $t1, 3 
	li $t2,5
	
	add $t3,$t0,$t1
	mult $t0,$t3
	mflo $t4
	mult $t4,$t2
	
    li $v0, 4    #;msg1       
    la $a0, msg1        
    syscall
	
	li $v0, 1
    mflo $a0
    syscall

    jr $ra              

    .data
msg1:   .asciiz "Result : "