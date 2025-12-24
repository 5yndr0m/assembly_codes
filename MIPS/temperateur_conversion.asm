#; temperateur_conversion.asm
#; Converts temperature between Celsius and Fahrenheit based on user input

.data
prompt_choice1: .asciiz "Pick measurement to convert from (C/F/K/Quit): \n"
prompt_choice2: .asciiz "Pick measurement to convert to (C/F/K): \n"
prompt_temp: .asciiz "Enter temperature value: \n"
result_msg: .asciiz "The converted temperature is: "

.text
main:
# prompt for conversion choice
li $v0, 4
la $a0, prompt_choice1
syscall

# read conversion choice
li $v0, 12
syscall
move $t0, $v0
beq $t0, 'Q', end_program

# prompt for target choice
li $v0, 4
la $a0, prompt_choice2
syscall

# read target choice
li $v0, 12
syscall
move $t1, $v0

# prompt for temperature value
li $v0, 4
la $a0, prompt_temp
syscall

# read temperatur value
li $v0, 6
syscall
mov.s $f0, $f0

# perform conversion
beq $t0, 'C', from_celsius
beq $t0, 'F', from_fahrenheit
beq $t0, 'K', from_kelvin
j end_program

from_celsius:
beq $t1, 'F', c_to_f
beq $t1, 'K', c_to_k
j end_program

from_fahrenheit:
beq $t1, 'C', f_to_c
beq $t1, 'K', f_to_k
j end_program

from_kelvin:
beq $t1, 'C', k_to_c
beq $t1, 'F', k_to_f
j end_program

c_to_f:
li.s $f1, 9.0
li.s $f2, 5.0
mul.s $f3, $f0, $f1
div.s $f3, $f3, $f2
li.s $f4, 32.0
add.s $f0, $f3, $f4
j print_result

c_to_k:
li.s $f1, 273.15
add.s $f0, $f0, $f1
j print_result

f_to_c:
li.s $f1, 32.0
sub.s $f0, $f0, $f1
li.s $f2, 5.0
li.s $f3, 9.0
mul.s $f4, $f0, $f2
div.s $f0, $f4, $f3
j print_result

f_to_k:
li.s $f1, 32.0
sub.s $f0, $f0, $f1
li.s $f2, 5.0
li.s $f3, 9.0
mul.s $f4, $f0, $f2
div.s $f0, $f4, $f3
li.s $f5, 273.15
add.s $f0, $f0, $f5
j print_result

k_to_c:
li.s $f1, 273.15
sub.s $f0, $f0, $f1
j print_result

k_to_f:
li.s $f1, 273.15
sub.s $f0, $f0, $f1
li.s $f2, 9.0
li.s $f3, 5.0
mul.s $f4, $f0, $f2
div.s $f0, $f4, $f3
li.s $f5, 32.0
add.s $f0, $f0, $f5
j print_result

print_result:
# print result message
li $v0, 4
la $a0, result_msg
syscall

# print result
li $v0, 2
mov.s $f12, $f0
syscall
j end_program

end_program:
# exit program
li $v0, 10
syscall

