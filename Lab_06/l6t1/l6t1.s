  .text
 main:
      li a0, 1
      li s0, 2500
    addi sp, sp, -4
   sw s0, 0(sp)
     jal ra, procedure
   lw s0, 0(sp)
    addi sp, sp, 4
   add t1, s0, a0
      li a0, 1
   mv a1, t1
    ecall
 procedure:
      li s0, 3
      li t0, 1000
   add a0, s0, t0
     jalr zero, ra, 0
