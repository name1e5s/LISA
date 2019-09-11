#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t1_add_test)

    TEST_BEGIN

    TEST_RR(1, add, 0x00000000, 0x00000000, 0x00000000);
    TEST_RR(2, add, 0x00000002, 0x00000001, 0x00000001);
    TEST_RR(3, add, 0x0000000a, 0x00000003, 0x00000007);

    TEST_RR(4, add, 0xffff8000, 0x00000000, 0xffff8000);
    TEST_RR(5, add, 0x80000000, 0x80000000, 0x00000000);

    TEST_RR(6, add, 0x00007fff, 0x00000000, 0x00007fff);

    TEST_RR(7, add, 0x80007fff, 0x80000000, 0x00007fff);

    TEST_RR(8, add, 0xffffffff, 0x00000000, 0xffffffff);
    TEST_RR(9, add, 0x00000000, 0xffffffff, 0x00000001);

    TEST_RR_SRC1_EQ_DEST(10, add, 24, 13, 11);
    TEST_RR_SRC2_EQ_DEST(11, add, 25, 14, 11);
    
    TEST_RR_SRC12_EQ_DEST(12, add, 26, 13);

    TEST_RR_ZERO_SRC1(13, add, 15, 15);
    TEST_RR_ZERO_SRC2(14, add, 32, 32);
    TEST_RR_ZERO_DEST(15, add, 16, 30);

    TEST_END

END(t1_add_test)