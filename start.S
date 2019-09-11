#include <regdef.h>
#include <machine.h>
#include <asm.h>

#define TEST_NUM 1

#define TEST_UNIT(test_name) \
    jal     test_name    ;  \
    nop                  ;  \
    jal     wait_1s      ;  \
    nop                  

    .set    noreorder
    .globl  _start
    .globl  start
    .globl  __main
_start:
start:
    b   test_init
    nop

## avoid branch doesn't work
1:
    b   1b
    nop

.org 0x100
test_finish:
    addiu   t0, t0, 1
    li      t1, 0xff
    li      t2, VUART_ADDR
    sw      t1, 0x0(t2)
    b       test_finish
    nop

## avoid branch doesn't work
1:
    b       1b
    nop

test_init:
    .set noreorder
    
    ## set up led
    li      a0, LED_LO_ADDR
    li      a1, LED_HI_ADDR
    li      t0, 0xaaaa

    sw      t0, 0(a0)
    sw      t0, 0(a1)

    b       inst_test
    nop

## avoid branch doesn't work
1:
    b       1b
    nop

inst_test:
    TEST_UNIT(t0_empty_test)
    TEST_UNIT(t1_add_test)
    TEST_UNIT(t2_addu_test)
    TEST_UNIT(t3_addi_test)
    TEST_UNIT(t4_addiu_test)

test_end:
    li      s0, TEST_NUM
    beq     s0, s3, 1f
    nop

    b       2f
    nop

1:
    li      t1, 0xffff
    li      a0, LED_HI_ADDR
	li      a1, LED_LO_ADDR
    sw      t1, 0(a0)
    sw      t1, 0(a1)

2:
	jal     test_finish
    nop

wait_1s:
    li      t0, SWITCH_IN_ADDR
    li      t1, 0xaaaa

    #initial t3
    lw      t2, 0x0(t0)   #switch_interleave: {switch[7],1'b0, switch[6],1'b0...switch[0],1'b0}
    xor     t2, t2, t1
    sll     t3, t2, 9     #t3 = switch interleave << 9
    addiu   t3, t3, 1

sub1:  
    addiu   t3, t3, -1

    #select min{t3, switch_interleave}
    lw      t2, 0x0(t0)   #switch_interleave: {switch[7],1'b0, switch[6],1'b0...switch[0],1'b0}
    xor     t2, t2, t1
    sll     t2, t2, 9     #switch interleave << 9
    sltu    t4, t3, t2
    bnez    t4, 1f 
    nop
    addu    t3, t2, 0
1:
    bne     t3,zero, sub1
    nop
    jr      ra
    nop
