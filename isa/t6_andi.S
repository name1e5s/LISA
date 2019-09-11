#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t6_andi_test)

    TEST_BEGIN

    TEST_RI(1, andi, 0xff00ff00, 0xff00ff00, 0xf0f);
    TEST_RI(2, andi, 0x000000f0, 0x0ff00ff0, 0x0f0);
    TEST_RI(3, andi, 0x0000000f, 0x00ff00ff, 0x70f);
    TEST_RI(4, andi, 0x00000000, 0xf00ff00f, 0x0f0);

    TEST_RI_SRC_EQ_DEST(5, andi, 0x00000000, 0xff00ff00, 0x0f0);

    TEST_RI_ZERO_SRC(6, andi, 0, 0x0f0);
    TEST_RI_ZERO_DEST(7, andi, 0x00ff00ff, 0x70f);

    TEST_END

END(t6_andi_test)