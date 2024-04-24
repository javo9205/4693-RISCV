`ifndef CTRL_SIGNAL_ENUMS_JAVO9205_AT_COLORADO_EDU
`define CTRL_SIGNAL_ENUMS_JAVO9205_AT_COLORADO_EDU

typedef enum reg [3:0] {
    REGISTER, IMM_SEL,
    ALUOP, ALUSRC1, ALUSRC2,
    REGWRITE, RFWT_SEL,
    BRANCHOP, BRNCH_SEL,
    MEM_OP, RFF_SEL, FWD_SEL, XPR
} control_signal_t;

typedef enum reg [2:0] {
    IMM_NONE,
    IMM_ITYPE,
    IMM_BTYPE,
    IMM_UTYPE,
    IMM_STYPE,
    IMM_JTYPE
} imm_sel_t;

typedef enum reg [3:0] {
    NOP, ADD, SUB, AND, OR, XOR,
    SLL, SRL, SRA, SLT, SLTU
} aluop_t;

typedef enum reg [1:0] { ALU1_ZERO, ALU1_REG, ALU1_PC } src1_t;
typedef enum reg [0:0] { ALU2_IMM, ALU2_REG           } src2_t;
typedef enum reg [0:0] { WE_FALSE, WE_TRUE            } regwrite_t;
typedef enum reg [1:0] { RFWT_ALU, RFWT_PC, RFWT_MEM  } rfwt_sel_t;

typedef enum reg [2:0] {
    BRANCH_FALSE,
    BRANCH_TRUE,
    BRANCH_COND_FALSE,
    BRANCH_COND_TRUE,
    BRANCH_ID_TRUE,
    BRANCH_EX_TRUE,
    BRANCH_EX_COND_FALSE,
    BRANCH_EX_COND_TRUE
} branchop_t;

typedef enum reg [0:0] {
    BRADD_ALU,
    BRADD_ADDR
} brnch_sel_t;

typedef enum reg [3:0] {
    MEM_NOP  = 4'h0,
    MEM_SB   = 4'h1,
    MEM_SH   = 4'h2,
    MEM_SW   = 4'h3,
    MEM_LOAD = 4'h8,
    MEM_LB   = 4'h9,
    MEM_LBU  = 4'hA,
    MEM_LH   = 4'hB,
    MEM_LHU  = 4'hC,
    MEM_LW   = 4'hD
} mem_op_t;

typedef enum reg [1:0] {
    RFF_ID_RSx_VALUE,
    RFF_WB_FWDA_VALUE,
    RFF_WB_FWDB_VALUE
} rff_sel_t;

typedef enum reg [2:0] {
    DHF_EX_RSx_VALUE,
    DHF_ME_FWDA_VALUE,
    DHF_ME_FWDB_VALUE,
    DHF_WB_FWDA_VALUE,
    DHF_WB_FWDB_VALUE
} fwd_sel_t;

typedef enum reg [4:0] { x[0:31] } xpr_t;

`endif

