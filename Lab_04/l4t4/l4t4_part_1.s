 .data

 var1: .word 10
 var2: .word 20
 var3: .word 30
 var4: .word 40
var5: .word 50

.text

.globl main

la t0,var1

lw s0,0(t0)
lw s1,4(t0)
lw s2,8(t0)
lw s3,12(t0)
lw s4,16(t0)

add s5,s0,s1
add s5,s5,s2
add s5,s5,s3
add s5,s5,s4
