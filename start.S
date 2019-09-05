#include <regdef.h>

	.set	noreorder
	.globl	_start
	.globl	start
	.globl	__main
_start:
start:
    li    t0, 0xffffffff
    addiu t0, zero, 0xffff
	jal t1_add_test
	nop