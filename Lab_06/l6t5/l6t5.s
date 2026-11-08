  .text
 main:
      li a0, 3
     jal ra, EqSolver
   mv a1, a0
      li a0, 1
    ecall
 EqSolver:
   mul t0, a0, a0
   mul t1, t0, a0
      li t2, 5
   mul t3, t0, t2
      li t4, 6
   mul t5, a0, t4
   add t1, t1, t3
   add a0, t1, t5
     jalr zero, ra, 0
