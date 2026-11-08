.text

main:

    li a0, 5

    li a1, 5

  beq a1, zero, callFun1

  beq a0, a1, callFun2
   jal ra, fun3

    j display

callFun1:

   jal ra, fun1

    j display

callFun2:

   jal ra, fun2

display:

  mv a1, a0

    li a0, 1

   ecall

fun1:

  mul a0, a0, a0

   jalr zero, ra, 0

fun2:

  mul t0, a0, a0

  mul a0, t0, a0

   jalr zero, ra, 0




fun3:

  addi a0, a0, 1

   jalr zero, ra, 0
