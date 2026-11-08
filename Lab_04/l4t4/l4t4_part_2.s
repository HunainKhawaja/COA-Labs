.data

var1: .word 2
var2: .word 4
var3: .word 6
var4: .word 8
var5: .word 10
var6: .word 12
var7: .word 14
var8: .word 16
var9: .word 18
var10: .word 20

.text

.globl main

la t0,var1

lw s0,0(t0)
lw s1,4(t0)
lw s2,8(t0)
lw s3,12(t0)
lw s4,16(t0)
lw s5,20(t0)
lw s6,24(t0)
lw s7,28(t0)
lw s8,32(t0)
lw s9,36(t0)
