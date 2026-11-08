 .data
 .text
 .globl main main:
   addi s0,s0,5 #s0=a
 addi s1,s1,10 #s1=b
 addi s2,s2,4 #s2=d
 addi s3,s3,3 #s3=e
 beq s0,s1,Fin   True:
     add s4,s2,s3 #s4=c c=d+e
  j end    Fin:
     sub s4,s2,s3 #s4=c c=d-e end:
    sw s4,0(sp)
