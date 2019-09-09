#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t2_addiu_test)

    TEST_BEGIN

    TEST_RI(1, addiu, 0x00000000, 0x00000000, 0x0000);
    TEST_RI(2, addiu, 0x00000002, 0x00000001, 0x0001);
    TEST_RI(3, addiu, 0x0000000a, 0x00000003, 0x0007);

    TEST_RI(5, addiu, 0x80000000, 0x80000000, 0x0000);

    TEST_RI(7, addiu, 0x00007fff, 0x00000000, 0x7fff);
    TEST_RI(8, addiu, 0x7fffffff, 0x7fffffff, 0x0000);
    TEST_RI(9, addiu, 0x80007ffe, 0x7fffffff, 0x7fff);

    TEST_RI(10, addiu, 0x80007fff, 0x80000000, 0x7fff);

    TEST_RI(13, addiu, 0x00000000, 0xffffffff, 0x0001);

    TEST_RI_SRC_EQ_DEST(16, addiu, 24, 13, 11);
    TEST_RI_SRC_EQ_DEST(17, addiu, 25, 14, 11);

    TEST_RI_ZERO_SRC(19, addiu, 15, 15);
    TEST_RI_ZERO_SRC(20, addiu, 32, 32);
    TEST_RI_ZERO_DEST(21, addiu, 16, 30);

    TEST_END

END(t2_addiu_test)