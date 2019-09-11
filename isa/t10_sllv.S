#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t10_sllv_test)

    TEST_BEGIN

    TEST_RR(2,  sllv, 0x00000001, 0x00000001, 0 );
    TEST_RR(3,  sllv, 0x00000002, 0x00000001, 1 );
    TEST_RR(4,  sllv, 0x00000080, 0x00000001, 7 );
    TEST_RR(5,  sllv, 0x00004000, 0x00000001, 14);
    TEST_RR(6,  sllv, 0x80000000, 0x00000001, 31);

    TEST_RR(7,  sllv, 0xffffffff, 0xffffffff, 0 );
    TEST_RR(8,  sllv, 0xfffffffe, 0xffffffff, 1 );
    TEST_RR(9,  sllv, 0xffffff80, 0xffffffff, 7 );
    TEST_RR(10, sllv, 0xffffc000, 0xffffffff, 14);
    TEST_RR(11, sllv, 0x80000000, 0xffffffff, 31);

    TEST_RR(12, sllv, 0x21212121, 0x21212121, 0 );
    TEST_RR(13, sllv, 0x42424242, 0x21212121, 1 );
    TEST_RR(14, sllv, 0x90909080, 0x21212121, 7 );
    TEST_RR(15, sllv, 0x48484000, 0x21212121, 14);
    TEST_RR(16, sllv, 0x80000000, 0x21212121, 31);

    TEST_RR(17, sllv, 0x21212121, 0x21212121, 0xffffffe0);
    TEST_RR(18, sllv, 0x42424242, 0x21212121, 0xffffffe1);
    TEST_RR(19, sllv, 0x90909080, 0x21212121, 0xffffffe7);
    TEST_RR(20, sllv, 0x48484000, 0x21212121, 0xffffffee);
    TEST_RR(21, sllv, 0x00000000, 0x21212120, 0xffffffff);

    TEST_RR_SRC1_EQ_DEST(22, sllv, 0x00000080, 0x00000001, 7);
    TEST_RR_SRC2_EQ_DEST(23, sllv, 0x00004000, 0x00000001, 14);
    TEST_RR_SRC12_EQ_DEST(24, sllv, 24, 3);

    TEST_RR_ZERO_SRC1(25, sllv, 0, 15);
    TEST_RR_ZERO_SRC2(26, sllv, 32, 32);
    TEST_RR_ZERO_DEST(27, sllv, 1024, 2048);

    TEST_END

END(t10_sllv_test)