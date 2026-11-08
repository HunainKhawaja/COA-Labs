  .text
main:

    li a0, 5

    li a1, 2

    li t0, 1

  beq a1, t0, callF1

   blt a1, a0, callF2

   jal ra, F3

    j display

callF1:

   jal ra, F1

    j display

callF2:

   jal ra, F2

display:

  mv a1, a0

    li a0, 1

   ecall

F1:

  mul t0, a0, a0

  mul t1, a1, a1

  add a0, t0, t1

   jalr zero, ra, 0

F2:

  mul t0, a0, a0

  mul a0, t0, a0

   jalr zero, ra, 0
F3:

  addi a0, a0, 5

   jalr zero, ra, 0
