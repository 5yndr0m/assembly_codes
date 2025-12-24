#;readstring.asm
#;reading a string from the user and print it

.text
main:
	li $v0, 4     #;"Enter a message: "(print)      
    la $a0, msg0        
    syscall
	
	li $v0, 8		#;read msg              
    la $a0, msg                    
    syscall
	
	li $v0, 4       #;"You entered: "(print)
    la $a0, msg1        
    syscall
	
	li $v0, 4         #;print msg   
    la $a0, msg        
    syscall
	
	jr $ra
	
.data
msg0: .asciiz "Enter a message: "
msg1: .asciiz "You entered: "
msg: .space 50