#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t8_or_test)

    TEST_BEGIN

    TEST_RR(1, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f);
    TEST_RR(2, or, 0xfff0fff0, 0x0ff00ff0, 0xf0f0f0f0);
    TEST_RR(3, or, 0x0fff0fff, 0x00ff00ff, 0x0f0f0f0f);
    TEST_RR(4, or, 0xf0fff0ff, 0xf00ff00f, 0xf0f0f0f0);

    TEST_RR_SRC1_EQ_DEST(5, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f);
    TEST_RR_SRC2_EQ_DEST(6, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f);
    TEST_RR_SRC12_EQ_DEST(7, or, 0xff00ff00, 0xff00ff00);

    TEST_RR_ZERO_SRC1(8, or, 0xff00ff00, 0xff00ff00);
    TEST_RR_ZERO_SRC2(9, or, 0x00ff00ff, 0x00ff00ff);
    TEST_RR_ZERO_DEST(10, or, 0x11111111, 0x22222222);

    TEST_END

END(t8_or_test)