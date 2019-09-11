#include <asm.h>
#include <regdef.h>
#include <common_macros.h>

LEAF(t9_ori_test)

    TEST_BEGIN

    TEST_RI(1, ori, 0xffffff0f, 0xff00ff00, 0xf0f);
    TEST_RI(2, ori, 0x0ff00ff0, 0x0ff00ff0, 0x0f0);
    TEST_RI(3, ori, 0x00ff07ff, 0x00ff00ff, 0x70f);
    TEST_RI(4, ori, 0xf00ff0ff, 0xf00ff00f, 0x0f0);

    TEST_RI_SRC_EQ_DEST(5, ori, 0xff00fff0, 0xff00ff00, 0x0f0);

    TEST_RI_ZERO_SRC(6, ori, 0x0f0, 0x0f0);
    TEST_RI_ZERO_DEST(7, ori, 0x00ff00ff, 0x70f);

    TEST_END

END(t9_ori_test)