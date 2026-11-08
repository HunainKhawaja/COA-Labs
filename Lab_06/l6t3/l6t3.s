  .text
 main:
      li a0, 10
      li a1, 3
     jal ra, EqSolver
   mv a1, a0
      li a0, 1
    ecall
 EqSolver:
   add t0, a0, a1
    sub t1, a0, a1
   mul a0, t0, t1
     jalr zero, ra, 0
