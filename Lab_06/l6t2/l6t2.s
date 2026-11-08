.text
addi s0, zero, 5
addi t1, zero, 10
addi t0, zero, 15
addi sp, sp, -12
sw s0, 0(sp)
sw t0, 4(sp)
sw t1, 8(sp)
lw t4, 8(sp)
lw t2, 4(sp)
lw t3, 0(sp)
addi sp, sp, 12
