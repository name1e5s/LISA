#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t7_nor_test)

    TEST_BEGIN

    TEST_RR(1, nor, 0xff0fff0f, 0xff00ff00, 0xf0f0f0f0);
    TEST_RR(2, nor, 0xfff0fff0, 0x0ff00ff0, 0x0f0f0f0f);
    TEST_RR(3, nor, 0x0fff0fff, 0x00ff00ff, 0xf0f0f0f0);
    TEST_RR(4, nor, 0xf0fff0ff, 0xf00ff00f, 0x0f0f0f0f);

    TEST_RR_SRC1_EQ_DEST(5, nor, 0xff0fff0f, 0xff00ff00, 0xf0f0f0f0);
    TEST_RR_SRC2_EQ_DEST(6, nor, 0xff0fff0f, 0xff00ff00, 0xf0f0f0f0);
    TEST_RR_SRC12_EQ_DEST(7, nor, 0xff00ff00, 0x00ff00ff);

    TEST_RR_ZERO_SRC1(8, nor, 0xff00ff00, 0x00ff00ff);
    TEST_RR_ZERO_SRC2(9, nor, 0x00ff00ff, 0xff00ff00);
    TEST_RR_ZERO_DEST(10, nor, 0x11111111, 0x22222222);

    TEST_END

END(t7_nor_test)