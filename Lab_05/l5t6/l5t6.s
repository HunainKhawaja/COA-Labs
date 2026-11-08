 .data
 .text
 .globl main main:
       li t0,0     # t0: index = 0      li t1,5     #
  t1: total number of indexes = 5      li t2,0
 # t2: counter = 0   bgt t1,t0,Fin True:      j end
 Fin:
   addi t2,t2,1  # counter++
 addi t0,t0,1  # index++
 bgt t1,t0,Fin end:
  sw t2,0(sp)
