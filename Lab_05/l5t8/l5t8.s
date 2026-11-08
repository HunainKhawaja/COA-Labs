 .data
 .text
 .globl main main:
       li t0,0 # t0: x-index = 0       li t1,3 # t1:
 total number of x indexes = 3       li t2,0 # t2:
 counter = 0       li t3,0 # t3: y-index = 0       li
 t4,2 # t4: total number of y indexes = 2
 bgt t1,t0,Fin    True:
           j end
 Fin:
     bgt t4,t3,New
 New_True:        addi
 t0,t0,1 # x++                li
 t3,0 # y = 0



       bgt t1,t0,Fin                j end
 New:       add t2,t0,t3 # Counter
 = x + y        addi t3,t3,1 # y++
  j Fin     end:
      sw t2,0(sp)
