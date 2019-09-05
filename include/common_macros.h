#ifndef __COMMON_MACROS
#define __COMMON_MACROS

#include <regdef.h>

#define TEST_CASE(num, reg_dest, val_expected, code...) \
test_ ## num : \
    code; \
    li k1, val_expected; \
    li k0, num; \
    bne reg_dest, k1, test_failed;

# Tests for instructions with R-R operations

#define TEST_RR(num, inst, result, src_1, src_2) \
    TEST_CASE(num, t0, result, \
        li  t1, src_1;      \
        li  t2, src_2;      \
        inst t0, t1, t2;    \
    )

#define TEST_RR_SRC1_EQ_DEST(num, inst, result, src_1, src_2) \
    TEST_CASE(num, t0, result, \
        li  t0, src_1;      \
        li  t1, src_2;      \
        inst t0, t0, t1;    \
    )

#define TEST_RR_SRC2_EQ_DEST(num, inst, result, src_1, src_2) \
    TEST_CASE(num, t0, result, \
        li  t0, src_1;      \
        li  t1, src_2;      \
        inst t0, t1, t0;    \
    )

#define TEST_RR_SRC12_EQ_DEST(num, inst, result, src) \
    TEST_CASE(num, t0, result, \
        li  t0, src;      \
        inst t0, t0, t0;  \
    )

#define TEST_RR_ZERO_SRC1(num, inst, result, src) \
    TEST_CASE(num, t0, result, \
        li  t1, src;        \
        inst t0, t1, zero;  \
    )

#define TEST_RR_ZERO_SRC2(num, inst, result, src) \
    TEST_CASE(num, t0, result, \
        li  t1, src;        \
        inst t0, zero, t1;  \
    )

#define TEST_RR_ZERO_DEST(num, inst, src)   \
    TEST_CASE(num, zero, 0, \
        li  t1, src;        \
        inst zero, t1, t1;  \
    )

#endif