#;div.asm
#;division of 2 numbers
.text
main: 
    li $t0, 5           
    li $t1, 2          
    div $t0,$t1 

    li $v0, 4       #;msg0    
    la $a0, msg0        
    syscall
	
    li $v0, 1
    mfhi $a0
    syscall

    li $v0, 4    #;msg1       
    la $a0, msg1        
    syscall
	
	li $v0, 1
    mflo $a0
    syscall
	
    jr $ra              

    .data
msg0:   .asciiz "Remainder : "
msg1:   .asciiz "\nResult : "