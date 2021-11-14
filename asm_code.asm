main: 
    addi $t1, 10
    addi $t2, 5
    sw $t1, 0($zero)
    sw $t2, 1($zero)
    lw $t1, 0($zero)
    lw $t2, 1($zero)
Loop:
    comp $t3, $zero
    add $t3, $t1
    comp $t4, $zero
    comp $t4, $t2
    add $t3, $t4
    bz $t3,  EXIT
    bltz $t3, Loop1
    comp $t1, $zero
    add $t1, $t3
    b Loop
Loop1:
    comp $t2, $t3
    b Loop
EXIT:
    sw $t2, 2($zero)
    add $zero, $zero   
