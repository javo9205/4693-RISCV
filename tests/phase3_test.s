/*
 * phase3_test.s
 *
 * Author: James Vogenthaler
 * Date: September 21, 2023
 *
 */

 // Section .crt0 is always placed from address 0
	.section .crt0, "ax"

_start:
	.global _start

    //==========================================================================
    SETUP:
        li      x1,   0             // Result register
        li      x30,  1             // x30 =  1 or 0x00000001 - DO NOT MODIFY
        li      x31, -1             // x31 = -1 or 0xffffffff - DO NOT MODIFY
    /*-------------------------------------------------*/
    /* Generate alternating bit values                 */
    /*-------------------------------------------------*/
        li      x20, 0x555 
        slli    x18, x20, 12 
        addi    x18, x18, 0x550 
        slli    x18, x18, 8         // x18 = 0x55555000
        addi    x28, x18, 0x555     // x28 = 0x55555555
        slli    x29, x28, 1         // x29 = 0xAAAAAAAA
        addi    x19, x29, 0x555     // x19 = 0xAAAAAFFF
    /*-------------------------------------------------*/
    /* Generate other useful values                    */
    /*-------------------------------------------------*/
        slli    x20, x20, 1
        addi    x20, x20, 0x555     // x20 = 0x00000FFF
        li      x21, 0
        li      x22, 0
        li      x10, 0x123
        li      x11, 0x456
        li      x12, 0x78
        jal     x5, FN_32I
        or      x21, x21, x10       // x21 = 0x12345678
        li      x10, 0xDEA
        li      x11, 0xDBE
        li      x12, 0xEF
        jal     x5, FN_32I
        or      x22, x22, x10       // x22 = 0xDEADBEEF
        slli    x23, x30, 31        // x23 = 0x80000000
        addi    x24, x23, -1        // x24 = 0x7FFFFFFF

    //==========================================================================
    XOR_TEST:
    /*-------------------------------------------------*/
    /* TEST 1: 0 ^ 0 = 0                               */
    /*-------------------------------------------------*/
        xor     x6,  x0,  x0        // x6 = 0x00000000 ^ 0x000000000
        bne     x6,  x0,  XOR_FAIL  // if (x6 != 0) XOR_FAIL();
    /*-------------------------------------------------*/
    /* TEST 2: -1 ^ -1 = 0                             */
    /*-------------------------------------------------*/
        xor     x6,  x31, x31       // x6 = 0xFFFFFFFF ^ 0xFFFFFFFFF
        bne     x6,  x0,  XOR_FAIL  // if (x6 != 0) XOR_FAIL()
    /*-------------------------------------------------*/
    /* TEST 3: 0x5~5 ^ 0xA~A = 0                       */
    /*-------------------------------------------------*/
        xor     x6,  x28, x29       // x6 = 0x55555555 ^ 0xAAAAAAAAA
        bne     x6,  x31, XOR_FAIL  // if (x6 != -1) XOR_FAIL()
    /*-------------------------------------------------*/
    /* TEST 4: 0xA~A ^ 0x5~5 = 0                       */
    /*-------------------------------------------------*/
        xor     x6,  x29, x28       // x6 = 0xAAAAAAAA ^ 0x555555555
        beq     x6,  x31, ANDI_TEST // if (x6 != -1) XOR_FAIL()
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    XOR_FAIL:
        li      x10, 0
        jal     x5, FN_LOGERROR

    //==========================================================================
    ANDI_TEST:
    /*-------------------------------------------------*/
    /* TEST 1: 0 & 0 = 0                               */
    /*-------------------------------------------------*/
        andi    x6,  x0,  0         // x6 = 0x00000000 & 0x00000000
        bne     x6,  x0,  ANDI_FAIL // if (x6 != 0x00000000) ANDI_FAIL()
    /*-------------------------------------------------*/
    /* TEST 2: -1 & -1 = -1                            */
    /*-------------------------------------------------*/
        andi    x6,  x31, -1        // x6 = 0xFFFFFFFF & 0xFFFFFFFF
        bne     x6,  x31, ANDI_FAIL // if (x6 != 0xFFFFFFFF) ANDI_FAIL()
    /*-------------------------------------------------*/
    /* TEST 3: 0x5~5 & 0xF~FAAA = 0x5~5000             */
    /*-------------------------------------------------*/
        andi    x6,  x28, 0xAAA     // x6 = 0x55555555 & 0xFFFFFAAA
        bne     x6,  x18, ANDI_FAIL // if (x6 != 0x55555000) ANDI_FAIL()
    /*-------------------------------------------------*/
    /* TEST 4: 0xA~A & 0x0~0555 = 0                    */
    /*-------------------------------------------------*/
        andi    x6,  x29, 0x555     // x6 = 0xAAAAAAAA & 0x00000555
        beq     x6,  x0,  ORI_TEST  // if (x6 != 0x00000000) ANDI_FAIL()
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    ANDI_FAIL:
        li      x10, 1
        jal     x5, FN_LOGERROR

    //==========================================================================
    ORI_TEST:
    /*-------------------------------------------------*/
    /* TEST 1: 0 | 0 = 0                               */
    /*-------------------------------------------------*/
        ori     x6,  x0,  0         // x6 = 0x00000000 & 0x00000000
        bne     x6,  x0,  ORI_FAIL  // if (x6 != 0x00000000) ORI_FAIL()
    /*-------------------------------------------------*/
    /* TEST 2: -1 | -1 = -1                            */
    /*-------------------------------------------------*/
        ori     x6,  x31, -1        // x6 = 0xFFFFFFFF & 0xFFFFFFFF
        bne     x6,  x31, ORI_FAIL  // if (x6 != 0xFFFFFFFF) ORI_FAIL()
    /*-------------------------------------------------*/
    /* TEST 3: 0x5~5 | 0xF~FAAA = -1                   */
    /*-------------------------------------------------*/
        ori     x6,  x28, 0xAAA     // x6 = 0x55555555 & 0xFFFFFAAA
        bne     x6,  x31, ORI_FAIL  // if (x6 != 0xFFFFFFFF) ORI_FAIL()
    /*-------------------------------------------------*/
    /* TEST 4: 0xA~A | 0x0~0555 = 0xA~AFFF             */
    /*-------------------------------------------------*/
        ori     x6,  x29, 0x555     // x6 = 0xAAAAAAAA & 0x00000555
        beq     x6,  x19, SLT_TEST  // if (x6 != 0xAAAAAFFF) ORI_FAIL()
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    ORI_FAIL:
        li      x10, 2
        jal     x5, FN_LOGERROR

    //==========================================================================
    SLT_TEST:
    /*-------------------------------------------------*/
    /* TEST 1: (0 < 0) == 0                            */
    /*-------------------------------------------------*/
        slt     x6,  x0,  x0        // x6 = (0 < 0)
        bne     x6,  x0,  SLT_FAIL  // if (x6 != 0) SLT_FAIL()
    /*-------------------------------------------------*/
    /* TEST 2: (-1 < -1) == 0                          */
    /*-------------------------------------------------*/
        slt     x6,  x31, x31       // x6 = (-1 < -1)
        bne     x6,  x0,  SLT_FAIL  // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 3: (-1 < 0) == 1                            */
    /*--------------------------------------------------*/
        slt     x6,  x31, x0        // x6 = (-1 < 0)
        bne     x6,  x30, SLT_FAIL  // if (x6 != 1) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 4: (0 < -1) == 0                            */
    /*--------------------------------------------------*/
        slt     x6,  x0,  x31       // x6 = (0 < -1)
        bne     x6,  x0,  SLT_FAIL  // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 5: (0x5~5 < 0xA~A) == 0                     */
    /*--------------------------------------------------*/
        slt     x6,  x28, x29       // x6 = (0x55555555 < 0xAAAAAAAA)
        bne     x6,  x0,  SLT_FAIL  // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 6: (0xA~A < 0x5~5) == 1                     */
    /*--------------------------------------------------*/
        slt     x6,  x29, x28       // x6 = (0xAAAAAAAA < 0x55555555)
        beq     x6,  x30, SLTU_TEST // if (x6 != 1) SLT_FAIL()
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    SLT_FAIL:
        li      x10, 3
        jal     x5, FN_LOGERROR

    //==========================================================================
    SLTU_TEST:
    /*--------------------------------------------------*/
    /* TEST 1: (0 < 0) == 0                             */
    /*--------------------------------------------------*/
        sltu    x6,  x0,  x0        // x6 = (0x00000000 < 0x00000000)
        bne     x6,  x0,  SLTU_FAIL // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 2: (0xF~F < 0xF~F) == 0                     */
    /*--------------------------------------------------*/
        sltu    x6,  x31, x31       // x6 = (0xFFFFFFFF < 0xFFFFFFFF)
        bne     x6,  x0,  SLTU_FAIL // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 3: (0 < 0xF~F) == 1                         */
    /*--------------------------------------------------*/
        sltu    x6,  x0,  x31       // x6 = (0x00000000 < 0xFFFFFFFF)
        bne     x6,  x30, SLTU_FAIL // if (x6 != 1) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 4: (-1 < 0) == 0                            */
    /*--------------------------------------------------*/
        sltu    x6,  x31, x0        // x6 = (0xFFFFFFFF < 0x00000000)
        bne     x6,  x0,  SLTU_FAIL // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 5: (0x5~5 < 0xA~A) == 1                     */
    /*--------------------------------------------------*/
        sltu    x6,  x28, x29       // x6 = (0x55555555 < 0xAAAAAAAA)
        bne     x6,  x30, SLTU_FAIL // if (x6 != 1) SLT_FAIL()
    /*--------------------------------------------------*/
    /* TEST 6: (0xA~A < 0x5~5) == 0                     */
    /*--------------------------------------------------*/
        sltu    x6,  x29, x28        // x6 = (0xAAAAAAAA < 0x55555555)
        beq     x6,  x0,  AUIPC_TEST // if (x6 != 0) SLT_FAIL()
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    SLTU_FAIL:
        li      x10, 4
        jal     x5, FN_LOGERROR

    //==========================================================================
    AUIPC_TEST:
    /*--------------------------------------------------*/
    /* TEST 1: AUIPIC + 0                               */
    /*--------------------------------------------------*/
        jal     x6,  4              // x6 = PC + 4;                 PC += 4;
        auipc   x7,  0              // x7 = PC + 0;                 PC += 4;
        bne     x6,  x7, AUIPC_FAIL // if (x6 != x7) AUIPC_FAIL();  PC += 4;
    /*--------------------------------------------------*/
    /* TEST 2: AUPIC + 0xFFFFF000                       */
    /*--------------------------------------------------*/
        jal     x6,  4              // x6 = PC + 4;                 PC += 4;
        auipc   x7,  0xFFFFF        // x7 = PC + 0xFFFFF000;        PC += 4;
        addi    x7,  x7, 0x400      // x7 += 0x00000400;            PC += 4;
        addi    x7,  x7, 0x400      // x7 += 0x00000400;            PC += 4;
        addi    x6,  x6, 0x800      // x6 += 0xFFFFF800;            PC += 4;
        bne     x6,  x7, AUIPC_FAIL // if (x6 != x7) AUIPC_FAIL();  PC += 4;
    /*--------------------------------------------------*/
    /* TEST 3: AUPIC + 0x00001000                       */
    /*--------------------------------------------------*/
        jal     x6,  4              // x6 = PC + 4;                 PC += 4;
        auipc   x7,  0x00001        // x7 = PC + 0x00001000;        PC += 4;
        addi    x6,  x6, 0x400      // x6 += 0x00000400;            PC += 4;
        addi    x6,  x6, 0x400      // x6 += 0x00000400;            PC += 4;
        addi    x6,  x6, 0x400      // x6 += 0x00000400;            PC += 4;
        addi    x6,  x6, 0x400      // x6 += 0x00000400;            PC += 4;
        beq     x6,  x7, BLT_TEST   // if (x6 != x7) AUIPC_FAIL();  PC += 4;
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    AUIPC_FAIL:
        li      x10, 5
        jal     x5, FN_LOGERROR

    //==========================================================================
    BLT_TEST: // Bacon Lettuce Tomato
    /*--------------------------------------------------*/
    /* TEST 1: !(0 < 0)                                 */
    /*--------------------------------------------------*/
        blt     x0,  x0,  BLT_FAIL  // if ( 0 <  0) BLT_FAIL();
    /*--------------------------------------------------*/
    /* TEST 2: !(-1 < -1)                               */
    /*--------------------------------------------------*/
        blt     x31, x31, BLT_FAIL  // if (-1 < -1) BLT_FAIL();
    /*--------------------------------------------------*/
    /* TEST 3: !(0 < -1)                                */
    /*--------------------------------------------------*/
        blt     x0,  x31, BLT_FAIL  // if ( 0 < -1) BLT_FAIL();
    /*--------------------------------------------------*/
    /* TEST 4: !(0x5~5 < 0xA~A)                     */
    /*--------------------------------------------------*/
        blt     x28, x29, BLT_FAIL  // if (0x55555555 < 0xAAAAAAAA) BLT_FAIL();
    /*--------------------------------------------------*/
    /* TEST 5: -1 < 0                                   */
    /*--------------------------------------------------*/
        blt     x31, x0,  BLT_TEST6 // if(!(-1 < 0)) BLT_FAIL();
        jal     x0,  BLT_FAIL
    /*--------------------------------------------------*/
    /* TEST 6: 0xA~A < 0x5~5                            */
    /*--------------------------------------------------*/
    BLT_TEST6:
        blt     x29, x28, BLTU_TEST // if(!(0xAAAAAAAA < 0x55555555)) BLT_FAIL();
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    BLT_FAIL:
        li      x10, 6
        jal     x5, FN_LOGERROR

    //==========================================================================
    BLTU_TEST: // Bacon Lettuce Tomato Unwrapped
    /*--------------------------------------------------*/
    /* TEST 1: !(0 < 0)                                 */
    /*--------------------------------------------------*/
        bltu    x0,  x0,  BLTU_FAIL  // if (0x00000000 < 0x00000000) BLTU_FAIL();
    /*--------------------------------------------------*/
    /* TEST 2: !(0xF~F < 0xF~F)                         */
    /*--------------------------------------------------*/
        bltu    x31, x31, BLTU_FAIL  // if (0xFFFFFFFF < 0xFFFFFFFF) BLTU_FAIL();
    /*--------------------------------------------------*/
    /* TEST 3: !(0xF~F < 0)                             */
    /*--------------------------------------------------*/
        bltu    x31, x0,  BLTU_FAIL  // if (0xFFFFFFFF < 0x00000000) BLTU_FAIL();
    /*--------------------------------------------------*/
    /* TEST 4: !(0xA~A < 0x5~5)                         */
    /*--------------------------------------------------*/
        bltu    x29, x28, BLTU_FAIL  // if (0xAAAAAAAA < 0x55555555) BLTU_FAIL();
    /*--------------------------------------------------*/
    /* TEST 5: 0 < 0xF~F                                */
    /*--------------------------------------------------*/
        bltu    x0,  x31, BLTU_TEST6 // if(!(0xFFFFFFFF < 0x00000000)) BLTU_FAIL();
        jal     x0,  BLTU_FAIL
    /*--------------------------------------------------*/
    /* TEST 6: 0x5~5 < 0xA~A                            */
    /*--------------------------------------------------*/
    BLTU_TEST6:
        bltu    x28, x29, ADD_TEST   // if(!(0x55555555 < 0xAAAAAAAA)) BLTU_FAIL();
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    BLTU_FAIL:
        li      x10, 7
        jal     x5, FN_LOGERROR

    //==========================================================================
    ADD_TEST:
    /*--------------------------------------------------*/
    /* TEST 1: 0 + 0 = 0                                */
    /*--------------------------------------------------*/
        li      x11, 0
        add     x10, x11, x11       // x10 = x11 + x11
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 2: 1 + -1 = 0                               */
    /*--------------------------------------------------*/
        add     x10, x30, x31       // x10 = 1 + -1
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 3: 0x5~5 + 0x5~5 = 0xA~A                    */
    /*--------------------------------------------------*/
        or      x11, x11, x29       // x11 = 0xAAAAAAAA
        add     x10, x28, x28       // x10 = 0x55555555 + 0x55555555;
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 4: 0xA~A + 0xA~A + 1 = 0x5~5                */
    /*--------------------------------------------------*/
        li      x11, 0
        or      x11, x11, x28       // x11 = 0x55555555
        add     x10, x29, x29       // x10 = 0xAAAAAAAA + 0xAAAAAAAA;
        add     x10, x10, x30       // x10 += 1
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 5: -1 + -1 = -2                             */
    /*--------------------------------------------------*/
        li      x11, -2             // x11 = -2
        add     x10, x31, x31       // x10 = -1 + -1
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 6: -2 + 1 = -1                              */
    /*--------------------------------------------------*/
        li      x11, -1             // x11 = -1
        add     x10, x10, x30       // x10 += 1
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 7: 0x5~5 + 0xA~A = -1                       */
    /*--------------------------------------------------*/
        add     x10, x28, x29       // x10 = 0x55555555 + 0xAAAAAAAA
        bne     x10, x11, ADD_FAIL  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* TEST 8: 0xA~A + 0x5~5 = -1                       */
    /*--------------------------------------------------*/
        add     x10, x29, x28       // x10 = 0xAAAAAAAA + 0x55555555
        beq     x10, x11, SRA_TEST  // if (x10 != x11) ADD_FAIL();
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    ADD_FAIL:
        jal     x5, FN_LOCATEDIFF
        slli    x10,  x10,  8
        or      x1, x1, x10
        li      x10, 13
        jal     x5, FN_LOGERROR

    //==========================================================================
    SRA_TEST:
    /*--------------------------------------------------*/
    /* TEST 1 (0 >> 31) = 0
    /*--------------------------------------------------*/
        li      x7,  31             // x7 = 31
        sra     x6,  x0,  x7        // x6 = 0 >> 31
        bne     x6,  x0,  SRA_FAIL  // if (x6 != 0) SRA_FAIL();
    /*--------------------------------------------------*/
    /* TEST 2: (-1 >> 31) = -1
    /*--------------------------------------------------*/
        sra     x6,  x31, x7        // x6 = -1 >> 31
        bne     x6,  x31, SRA_FAIL  // if (x6 != -1) SRA_FAIL();
    /*--------------------------------------------------*/
    /* TEST 3 (0xA~A >> 1) = (0x80~0 | 0x5~5)
    /*--------------------------------------------------*/
        sra     x6,  x29, x30       // x6 = 0xAAAAAAAA >> 1
        or      x7,  x28, x23       // x7 = 0xD5555555
        bne     x6,  x7,  SRA_FAIL  // if (x6 != x7) SRA_FAIL();
    /*--------------------------------------------------*/
    /* TEST 4 (0x5~5 >> 1) = (0xA~A & 0x7F~F)
    /*--------------------------------------------------*/
        sra     x6,  x28, x30       // x6 = 0x55555555 >> 1
        and     x7,  x29, x24       // x7 = 0x2AAAAAAA
        beq     x6,  x7,  SRL_TEST  // if (x6 != x7) SRA_FAIL();
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    SRA_FAIL:
        li      x10, 14
        jal     x5, FN_LOGERROR

    //==========================================================================
    SRL_TEST:
    /*--------------------------------------------------*/
    /* TEST 1 (0 >> 31) = 0
    /*--------------------------------------------------*/
        li      x7,  31             // x7 = 31
        srl     x6,  x0,  x7        // x6 = 0 >> 31
        bne     x6,  x0,  SRL_FAIL  // if (x6 != 0) SRL_FAIL();
    /*--------------------------------------------------*/
    /* TEST 2: (0x8000000 >> 31) = 1
    /*--------------------------------------------------*/
        srl     x6,  x23, x7        // x6 = 0x80000000 >> 31
        bne     x6,  x30, SRL_FAIL  // if (x6 != 0) SRL_FAIL();
    /*--------------------------------------------------*/
    /* TEST 3 (0xA~A >> 1) = 0x5~5
    /*--------------------------------------------------*/
        srl     x6,  x29, x30       // x6 = 0xAAAAAAAA >> 1
        bne     x6,  x28,  SRL_FAIL  // if (x6 != x7) SRL_FAIL();
    /*--------------------------------------------------*/
    /* TEST 4 (0x5~5 >> 1) = (0xA~A >> 2)
    /*--------------------------------------------------*/
        li      x7,  2              // x7 = 2
        srl     x6,  x28, x30       // x6 = 0x55555555 >> 1
        srl     x7,  x29, x7        // x7 = 0xAAAAAAAA >> 2
        beq     x6,  x7,  LW_TEST   // if (x6 != x7) SRL_FAIL();
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    SRL_FAIL:
        li      x10, 15
        jal     x5, FN_LOGERROR

    //==========================================================================
    LW_TEST:
    /*--------------------------------------------------*/
    /* TEST 1: Store then Load 0x00000000
    /*--------------------------------------------------*/
        sb      x0,  0x7CF(x0)
        sb      x0,  0x7CE(x0)
        sb      x0,  0x7CD(x0)
        sb      x0,  0x7CC(x0)
        lw      x6,  0x7CC(x0)
        bne     x0,  x6, LW_FAIL
    /*--------------------------------------------------*/
    /* TEST 2: Store then Load 0x11111111
    /*--------------------------------------------------*/
        sb      x31, 0x7CF(x0)
        sb      x31, 0x7CE(x0)
        sb      x31, 0x7CD(x0)
        sb      x31, 0x7CC(x0)
        lw      x6,  0x7CC(x0)
        bne     x31, x6,  LW_FAIL
    /*--------------------------------------------------*/
    /* TEST 3: Store then Load 0x12345678
    /*--------------------------------------------------*/
        li      x6,  0x12
        sb      x6,  0x7CF(x0)
        li      x6,  0x34
        sb      x6,  0x7CE(x0)
        li      x6,  0x56
        sb      x6,  0x7CD(x0)
        li      x6,  0x78
        sb      x6,  0x7CC(x0)
        lw      x6,  0x7CC(x0)
        bne     x6,  x21, LW_FAIL
    /*--------------------------------------------------*/
    /* TEST 4: Store then Load 0xDEADBEEF
    /*--------------------------------------------------*/
        li      x6,  0xDE
        sb      x6,  0x7CF(x0)
        li      x6,  0xAD
        sb      x6,  0x7CE(x0)
        li      x6,  0xBE
        sb      x6,  0x7CD(x0)
        li      x6,  0xEF
        sb      x6,  0x7CC(x0)
        lw      x6,  0x7CC(x0)
        beq     x6,  x22, SW_TEST
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    LW_FAIL:
        li      x10, 16
        jal     x5, FN_LOGERROR

    //==========================================================================
    SW_TEST:
        li      x11, 0x7CC
    /*--------------------------------------------------*/
    /* TEST 1: Store then load 0x00000000               */
    /*--------------------------------------------------*/
        sw      x0,  0x0(x11)
        jal     x5,  FN_LOADBYTES
        bne     x10, x0,  SW_FAIL
    /*--------------------------------------------------*/
    /* TEST 2: Store then load 0xFFFFFFFF               */
    /*--------------------------------------------------*/
        sw      x31, 0x0(x11)
        jal     x5,  FN_LOADBYTES
        bne     x10, x31, SW_FAIL
    /*--------------------------------------------------*/
    /* TEST 3: Store then load 0x12345678               */
    /*--------------------------------------------------*/
        sw      x21, 0x0(x11)
        jal     x5, FN_LOADBYTES
        bne     x10, x21, SW_FAIL
    /*--------------------------------------------------*/
    /* TEST 3: Store then load 0xDEADBEEF               */
    /*--------------------------------------------------*/
        sw      x22, 0x0(x11)
        jal     x5, FN_LOADBYTES
        beq     x10, x22, SUB_TEST
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    SW_FAIL:
        li      x10, 17
        jal     x5, FN_LOGERROR

    //==========================================================================
    SUB_TEST:
    /*--------------------------------------------------*/
    /* TEST 1: 0 - 0 = 0                                */
    /*--------------------------------------------------*/
        li      x11, 0
        sub     x10, x11, x11       // x10 = x11 + x11
        bne     x10, x11, SUB_FAIL  // if (x10 != x11) SUB_FAIL();
    /*--------------------------------------------------*/
    /* TEST 2: -1 - -1 = 0
    /*--------------------------------------------------*/
        sub     x10, x31, x31       // x10 = -1 - -1
        bne     x10, x11, SUB_FAIL  // if (x10 != x11) SUB_FAIL();
    /*--------------------------------------------------*/
    /* TEST 3: 1 - -1 = 2
    /*--------------------------------------------------*/
        li      x11, 2              // x11 = 2
        sub     x10, x30, x31       // x10 = 1 - -1
        bne     x10, x11, SUB_FAIL  // if (x10 != x11) SUB_FAIL();
    /*--------------------------------------------------*/
    /* TEST 4: 0xA~A - 0x5~5 = 0x5~5                */
    /*--------------------------------------------------*/
        sub     x10, x29, x28       // x10 = 0xAAAAAAAA - 0x55555555
        bne     x10, x28, SUB_FAIL  // if (x10 != x28) SUB_FAIL();
    /*--------------------------------------------------*/
    /* TEST 5: 0x5~5 - 0xA~A - 1 = 0xA~A
    /*--------------------------------------------------*/
        sub     x10, x28, x29       // x10 = 0x55555555 - 0xAAAAAAAA
        sub     x10, x10, x30       // x10 -= 1
        beq     x10, x29, FINISH    // if (x10 != x29) SUB_FAIL();
    /*--------------------------------------------------*/
    /* LOG ERROR                                        */
    /*--------------------------------------------------*/
    SUB_FAIL:
        li      x10, 18
        jal     x5, FN_LOGERROR


    //==========================================================================
    // End of test sequence
    FINISH:
        nop
        nop
        nop
        nop
        nop
        halt
        nop
        nop
        nop

    //==========================================================================
    //! @fn uint32_t FN_32I(uint10_t x10, uint10_t x11, uint10_t x12);
    //! @brief Concatenates three immediates into a 32-bit immediate
    //! @param[in, out] x10 The 1st value, 12-bits. Stores return value
    //! @param[in]      x11 The 2nd value, 12-bits.
    //! @param[in]      x12 The 3rd value,  8-bits.
    //==========================================================================
    FN_32I:
        and     x11, x11, x20 // x11 &= 0x0FFF
        slli    x10, x10,  12 // x10 <<= 10
        or      x10, x10, x11 // x10 += x11
        slli    x10, x10,  8  // x10 <<= 10
        or      x10, x10, x12 // x10 += x12
        jalr     x0, 0x0(x5)  // return x10

    //==========================================================================
    //! @fn void logerror(uint5_t x10)
    //! @brief Sets the n'th least significant bit in x1
    //! @param[in] x10 - The n'th least significant bit, 0-indexed.
    //==========================================================================
    FN_LOGERROR:
        li      x6, 1       // x6 = 1
        sll     x6, x6, x10 // x6 <<= x10
        or      x1, x1, x6  // x1 |= x6
        jalr    x0, 0x0(x5) // return

    //==========================================================================
    //! @fn uint5_t locatediff(uint32_t x10, uint32_t x11);
    //! @brief Returns the position of the first LSB that differs between 2 vals
    //! @param[in,out] x10 - The 1st value to compare. Stores return value.
    //! @param[in]     x11 - The 2nd value to compare
    //==========================================================================
    FN_LOCATEDIFF:
        li      x6, -1                      // x6 = -1;
        li      x7, 1                       // x7 =  1;
        LOOP_LOCATEDIFF:                    // 
        beq     x7,  x0,  END_LOCATEDIFF    // while (x7 != 0) {
        and     x12, x10, x7                //     x12 = x10 & x7;
        and     x13, x11, x7                //     x13 = x11 & x7;
        slli    x7,  x7,  1                 //     x7 <<= 1;
        addi    x6,  x6,  1                 //     x6++;
        beq     x12, x13, LOOP_LOCATEDIFF   //     if (x12 == x13) break;
        END_LOCATEDIFF:                     // }
        li      x7,  0x1F                   // x7 = 0x1F;
        li      x10, 0                      // x10 = 0;
        or      x10, x10, x6                // x10 += x6;
        and     x10, x10, x7                // x10 &= x7;
        jalr    x0, 0x0(x5)                 // return x10;

    //==========================================================================
    //! @fn uint32_t loadbytes(uint32_t x10, uint32_t x11);
    //! @brief Returns the value at the given memory address
    //! @param[in]  x10 - Stores the return value
    //! @param[out] x11 - The memory address.
    //==========================================================================
    FN_LOADBYTES:
        li      x12, 0xFF
        li      x6,  4
        li      x10, 0
        addi    x11, x11, 4
        LOOP_LOADBYTES:
        addi    x11, x11, -1
        addi    x6,  x6,  -1
        lb      x7, 0x0(x11)
        and     x7,  x7,  x12
        slli    x10, x10, 8
        or      x10, x10, x7
        bne     x6,  x0,  LOOP_LOADBYTES
        END_LOADBYTES:
        jalr    x0, 0x0(x5)

