.text

main:

    li a0, 10

   jal ra, fib

  mv a1, a0

    li a0, 1

   ecall
fib:

  beq a0, zero, fib_zero




    li t0, 1

  beq a0, t0, fib_one




    li t0, 0

    li t1, 1

    li t2, 2




loop:

  bgt t2, a0, done

  add t3, t0, t1

  mv t0, t1

  mv t1, t3

  addi t2, t2, 1

    j loop




done:

  mv a0, t1

   jalr zero, ra, 0




fib_zero:

    li a0, 0

   jalr zero, ra, 0
fib_one:

    li a0, 1

   jalr zero, ra, 0
