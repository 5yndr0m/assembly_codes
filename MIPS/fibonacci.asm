#; fibonacci.asm
#; Computes the Fibonacci numbers upto Nth and displays them

.data
prompt_n: .asciiz "Enter the value of N (number of Fibonacci numbers to compute): \n"
result_msg: .asciiz "The Fibonacci sequence is: \n"

.text
main:
# prompt for N
li $v0, 4
la $a0, prompt_n
syscall

# read N
li $v0, 5
syscall
move $t0, $v0  # N in $t0

# print result message
li $v0, 4
la $a0, result_msg
syscall

li $t1, 0      # first Fibonacci number
li $t2, 1      # second Fibonacci number
li $t3, 0      # counter initialized to 0

fibonacci_loop:
beq $t3, $t0, end  # if counter == N, end
# print current Fibonacci number
li $v0, 1
move $a0, $t1
syscall

# compute next Fibonacci number
move $t4, $t1      # temp = first
add $t1, $t1, $t2  # first = first + second
move $t2, $t4      # second = temp
addi $t3, $t3, 1   # increment counter
j fibonacci_loop

end:
# exit program
li $v0, 10
syscall

