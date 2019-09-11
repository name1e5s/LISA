#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t5_and_test)

    TEST_BEGIN

    TEST_RR(1, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f);
    TEST_RR(2, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0);
    TEST_RR(3, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f);
    TEST_RR(4, and, 0xf000f000, 0xf00ff00f, 0xf0f0f0f0);

    TEST_RR_ZERO_SRC1(5, and, 0, 0xff00ff00);
    TEST_RR_ZERO_SRC2(6, and, 0, 0x00ff00ff);
    TEST_RR_ZERO_DEST(7, and, 0x11111111, 0x22222222);

    TEST_END

END(t5_and_test)