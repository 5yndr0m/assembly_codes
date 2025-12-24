    .data
aSide:  .word 73
bSide:  .word 14
cSide:  .word 16

volume: .word 0
surfaceArea:    .word 0

    .text
    .globl  main
    .ent    main
main:
    lw $t0, aSide
    lw $t1, bSide
    lw $t2, cSide

    mul $t3, $t0, $t1
    mul $t4, $t3, $t2
    sw $t4, volume

    mul $t3, $t0, $t1
    mul $t4, $t0, $t2
    mul $t5, $t1, $t2
    add $t6, $t3, $t4
    add $t7, $t6, $t5
    mul $t7, $t7, 2
    sw $t7, surfaceArea

    li $v0, 10
    syscall
.end main
