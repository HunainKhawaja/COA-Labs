.text

main:

    li a0, 10

   jal ra, fib

  mv a1, a0
    li a0, 1

   ecall




fib:

  beq a0, zero, base_zero




    li t0, 1

  beq a0, t0, base_one




  addi sp, sp, -12

  sw a0, 0(sp)

  sw ra, 8(sp)




  addi a0, a0, -1

   jal ra, fib

  sw a0, 4(sp)




  lw a0, 0(sp)

  addi a0, a0, -2

   jal ra, fib




  lw t0, 4(sp)

  add a0, a0, t0




  lw ra, 8(sp)

  addi sp, sp, 12
   jalr zero, ra, 0




base_zero:

    li a0, 0

   jalr zero, ra, 0




base_one:

    li a0, 1

   jalr zero, ra, 0
