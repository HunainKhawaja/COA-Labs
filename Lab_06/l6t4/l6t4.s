  .text
 main:
      li s0, 5
   mv a0, s0
     jal ra, AreaFinder
   mv t0, a0
   mv a0, s0
     jal ra, PerimeterFinder
   mv t1, a0
      li a0, 1
   mv a1, t0
    ecall
      li a0, 1
   mv a1, t1
    ecall
 AreaFinder:
   mul a0, a0, a0
     jalr zero, ra, 0
 PerimeterFinder:
      li t2, 4
   mul a0, a0, t2
     jalr zero, ra, 0
