#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t3_addi_test)

    TEST_BEGIN

    TEST_RI(1, addi, 0x00000000, 0x00000000, 0x0000);
    TEST_RI(2, addi, 0x00000002, 0x00000001, 0x0001);
    TEST_RI(3, addi, 0x0000000a, 0x00000003, 0x0007);

    TEST_RI(4, addi, 0x80000000, 0x80000000, 0x0000);

    TEST_RI(5, addi, 0x00007fff, 0x00000000, 0x7fff);

    TEST_RI(6, addi, 0x80007fff, 0x80000000, 0x7fff);

    TEST_RI(7, addi, 0x00000000, 0xffffffff, 0x0001);

    TEST_RI_SRC_EQ_DEST(8, addi, 24, 13, 11);
    TEST_RI_SRC_EQ_DEST(9, addi, 25, 14, 11);

    TEST_RI_ZERO_SRC(10, addi, 15, 15);
    TEST_RI_ZERO_SRC(11, addi, 32, 32);
    TEST_RI_ZERO_DEST(12, addi, 16, 30);

    TEST_END

END(t3_addi_test)