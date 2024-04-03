/*
 * addi_test.s
 *
 *  Created on: April 1st, 2022
 *      Author: kgraham
 */

 // Section .crt0 is always placed from address 0
	.section .crt0, "ax"

// This test exercises the add and addi instruction.  Success is indicated by looking at all of the
// register file registers in hex at the end of the simulation, which should be in line 119.
// They should contain:

// x1 - 0x5
// x2 - 0x2
// x3 - 0x4
// x4 - 0x8
// x5 - 0x50
// x6 - 0x20
// x7 - 0x40
// x8 - 0x80
// x9 - 0x100
// x10 - 0x200
// x11 - 0x400
// x12 - 0xfffff800
// x13 - 0xfffff000
// x14 - 0xffffe000
// x15 - 0xffffc000
// x16 - 0xffff8000
// x17 - 0xffff0000
// x18 - 0xfffe0000
// x19 - 0xfffc0000
// x20 - 0xfff80000
// x21 - 0xfff00000
// x22 - 0xffe00000
// x23 - 0xffc00000
// x24 - 0xff800000
// x25 - 0xff000000
// x26 - 0xfe000000
// x27 - 0xfc000000
// x28 - 0x00000040
// x29 - 0xfffffaaa
// x30 - 0x00000004
// x31 - 0x00000555

//Symbol start is used to obtain entry point information
_start:
	.global _start

	addi x12, x0, -2048		// Hex 0xfffff800
	addi x1, x0, 0x1
	addi x2, x0, 0x2
	nop
	addi x13, x12, -2048	// Hex 0xfffff800
	addi x3, x0, 0x4
	addi x4, x0, 0x8
	nop
	nop
	add x14, x13, x13
	addi x5, x4, 0x8
	add x31, x1, x3
	add x29, x2, x4
	add x15, x14, x14
	addi x6, x5, 0x10
	add x31, x31, x5
	add x30, x1, x1
	add x16, x15, x15
	addi x7, x6, 0x20
	add x29, x29, x6
	add x30, x30, x1
	add x17, x16, x16
	addi x8, x7, 0x40
	add x31, x31, x7
	add x30, x30, x1
	add x18, x17, x17
	addi x9, x8, 0x80
	add x29, x29, x8
	add x1, x30, x1			// x1 = 0x5
	add x19, x18, x18
	addi x10, x9, 0x100
	add x31, x31, x9
	add x28, x5, x5
	add x20, x19, x19
	addi x11, x10, 0x200
	add x29, x29, x10
	add x28, x28, x5
	add x21, x20, x20
	add x31, x31, x11
	nop
	add x28, x28, x5
	add x22, x21, x21
	add x29, x29, x12
	nop
	nop
	add x23, x22, x22
	add x5, x28, x5			// x5 = 0x50
	nop
	nop
	add x24, x23, x23
	nop
	nop
	nop
	add x25, x24, x24
	nop
	nop
	nop
	add x26, x25, x25
	nop
	nop
	nop
	add x27, x26, x26

FINISH:
	nop
	nop
	nop
	nop
	nop // Check if the values in your registers are correct
	halt
	nop
	nop
	nop