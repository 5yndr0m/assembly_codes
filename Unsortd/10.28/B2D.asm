 # B2D.asm
 # Takes a user-input integer and prints its binary representation
 
 .data
    prompt: .asciiz "Enter a positive integer: "
    result: .asciiz "Binary representation: "
    newline: .asciiz "\n"
    binary_array: .space 32     # Reserve space for 32 bits (max for a 32-bit integer)
    error_msg: .asciiz "Error: Please enter a positive integer.\n"
	
 .text
    main:
        # Print prompt
        li $v0, 4
        la $a0, prompt
        syscall
		
        # Read integer
        li $v0, 5
        syscall
        move $t0, $v0           # $t0 = input number
		
        # Check if input is positive
        blt $t0, $zero, error   # Branch to error if input < 0
		
        # Initialize variables
        la $t1, binary_array    # $t1 = base address of binary_array
        li $t2, 0               # $t2 = index for array
        move $t3, $t0           # $t3 = working copy of input
		
    convert_loop:
        # Check if number is 0
        beq $t3, $zero, print_binary
		
        # Get remainder (0 or 1)
        andi $t4, $t3, 1        # $t4 = $t3 % 2 (using bitwise AND)
        sb $t4, 0($t1)          # Store remainder in binary_array[index]
		
        # Divide number by 2
        srl $t3, $t3, 1         # $t3 = $t3 / 2 (shift right logical)
		
        # Increment array index and address
        addi $t2, $t2, 1        # index++
        addi $t1, $t1, 1        # Move to next word in array
        j convert_loop
		
    print_binary:
        # Print result message
        li $v0, 4
        la $a0, result
        syscall
		
        # Check if index is 0 (input was 0)
        beq $t2, $zero, print_zero
		
        # Print binary digits in reverse order
        move $t3, $t2           # $t3 = number of digits
        la $t1, binary_array    # Reset $t1 to array base
        sll $t4, $t3, 2         # $t4 = index * 4 (offset for last digit)
        add $t1, $t1, $t4       # $t1 = address of last digit
        addi $t1, $t1, -4       # Adjust to point to last stored digit
		
    print_loop:
        blez $t3, end_print     # Exit if no more digits
        lb $a0, 0($t1)          # Load binary digit
        li $v0, 1               # Print integer (0 or 1)
        syscall
		
        # Move to previous digit
        addi $t1, $t1, -4       # Decrement address
        addi $t3, $t3, -1       # Decrement digit count
        j print_loop
		
    print_zero:
        # Handle special case: input = 0
        li $a0, 0
        li $v0, 1
        syscall
        j end_print
		
    error:
        # Print error message
        li $v0, 4
        la $a0, error_msg
        syscall
        j exit
		
    end_print:
        # Print newline
        li $v0, 4
        la $a0, newline
        syscall
		
    exit:
        # Exit program
        li $v0, 10
        syscall