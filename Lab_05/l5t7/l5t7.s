 .data num: .word 0, 0, 0, 0, 0, 0, 0,
 0, 0, 0
 .text
 .globl main main:
       li t0, 0
  li t1, 5
 la t2, num
 Loop:
   bge t0, t1, End
 addi t3, t0, 5
  slli t4, t0, 2
 add t5, t2, t4
 sw t3, 0(t5)
 addi t0, t0, 1          j
 Loop
 End:
       j End
