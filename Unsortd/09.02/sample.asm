    #; sample.asm
    #; adds two constants (5 + 15) and leave the result
    .text
main: #; labels- used here for function name

    #; using li, pseudo instructions
    li $t0, 5           #; $t0 = 5
    li $t1, 15          #; $t1 = 15
    add $t2, $t0, $t1   #; $t2 = $t0 + $t1

    #; using ori instructions
    ori $t3, $zero, 50
    ori $t4, $zero, 100
    add $t5, $t3, $t4

    jr $ra              #; return