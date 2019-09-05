#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t1_add_test)
    .set noreorder
    addiu s0, s0 ,1
    addiu s2, zero, 0x0
    lui   t2, 0x1
###test inst
    TEST_RR(0, add, 2, 1, 1);
###score++
    addiu s3, s3, 1
###output (s0<<24)|s3
test_failed:  
    sll t1, s0, 24
    or t0, t1, s3 
    sw t0, 0(s1)
    jr ra
    nop
END(t1_add_test)