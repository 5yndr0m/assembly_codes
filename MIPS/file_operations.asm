.data
filename: .asciiz "textfile.txt"
buffer:   .space 1024
my_text:  .asciiz "MIPS File I/O Data" # Using text for a readable file
start:    .asciiz "Starting File Operation...\n"
end_p:    .asciiz "\nOperation Complete."

.text
main:
    # 1. Print Start Message
    li $v0, 4
    la $a0, start  # Fixed: added comma
    syscall

    # 2. Open File for Writing (Flags: 1 = Write, 0 = Mode)
    li $v0, 13
    la $a0, filename
    li $a1, 1      # Write mode
    li $a2, 0
    syscall
    move $s0, $v0  # Save File Descriptor in $s0

    # 3. Write Data to File
    li $v0, 15
    move $a0, $s0  # Use descriptor
    la   $a1, my_text
    li   $a2, 18   # Number of characters to write
    syscall

    # 4. Close the File
    li $v0, 16
    move $a0, $s0  # Fixed: must use the descriptor saved in $s0
    syscall

    # 5. Print End Message
    li $v0, 4
    la $a0, end_p
    syscall

    # 6. Exit
    li $v0, 10
    syscall
