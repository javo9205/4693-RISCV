#/bin/bash
__DIR=$( cd -- "$( dirname -- "$0}" )" >/dev/null 2>&1 && cd .. && pwd)

if [ -f ~/Downloads/rtl.tar ]; then
    if [ -f $__DIR/rtl.tar ]; then
        rm $__DIR/rtl.tar
    fi
    mv ~/Downloads/rtl.tar $__DIR/codasip.tar
fi

tar -xf $__DIR/codasip.tar

mv verilog core
for file in $(find core -name "*.v" | grep superscalar_ca_core_); do sed -i 's/superscalar_ca_core_//g' $file; done
for file in $(find core -name "*.v" | grep superscalar_ca_core_); do mv $file $(echo $file | sed 's/superscalar_ca_core_//') ; done
rm core/superscalar_ca*;
rm core/common/d_ff_rst_we_stall_clr_t.v;
sed -i 's/module t/\`include "Control_Signals.svh"\n\nmodule superscalar_core_t/' core/t.v

sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_aluop )/\1\1,.CS(ALUOP)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_alusrc1 )/\1\1,.CS(ALUSRC1)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_alusrc2 )/\1\1, .CS(ALUSRC2)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_regwrite )/\1\1,.CS(REGWRITE)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_rfwt_sel )/\1\1,.CS(RFWT_SEL)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_branchop )/\1\1,.CS(BRANCHOP)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_brnch_sel )/\1\1,.CS(BRNCH_SEL)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_memop )/\1\1,.CS(MEM_OP)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_rs1 )/\1\1,.CS(XPR)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_rs2 )/\1\1,.CS(XPR)\n\1\2/' core/t.v
sed -i -E 's/^( *)(\) r_(if|id|ex|me|wb)[0-9]_rd )/\1\1,.CS(XPR)\n\1\2/' core/t.v

sed -i -E 's/wire \[3:0\] (s_(if|id|ex|me|wb)[0-9]_immsel;)/imm_sel_t \1/' core/t.v
sed -i -E 's/wire \[3:0\] (s_(if|id|ex|me|wb)[0-9]_aluop;)/aluop_t \1/' core/t.v
sed -i -E 's/wire \[1:0\] (s_(if|id|ex|me|wb)[0-9]_alusrc1;)/src1_t \1/' core/t.v
sed -i -E 's/wire (s_(if|id|ex|me|wb)[0-9]_alusrc2;)/src2_t \1/' core/t.v
sed -i -E 's/wire (s_(if|id|ex|me|wb)[0-9]_regwrite;)/regwrite_t \1/' core/t.v
sed -i -E 's/wire \[1:0\] (s_(if|id|ex|me|wb)[0-9]_rfwt_sel;)/rfwt_sel_t \1/' core/t.v
sed -i -E 's/wire \[2:0\] (s_(if|id|ex|me|wb)[0-9]_branchop;)/branchop_t \1/' core/t.v
sed -i -E 's/wire (s_(if|id|ex|me|wb)[0-9]_brnch_sel;)/brnch_sel_t \1/' core/t.v
sed -i -E 's/wire \[3:0\] (s_(if|id|ex|me|wb)[0-9]_memop;)/mem_op_t \1/' core/t.v
sed -i -E 's/wire \[1:0\] (s_(if|id|ex|me|wb)[0-9]_rff[12]_sel;)/rff_sel_t \1/' core/t.v
sed -i -E 's/wire \[2:0\] (s_(if|id|ex|me|wb)[0-9]_fwd[AB]_sel;)/fwd_sel_t \1/' core/t.v
sed -i -E 's/wire \[4:0\] (s_(if|id|ex|me|wb)[0-9]_rs1;)/xpr_t \1/' core/t.v
sed -i -E 's/wire \[4:0\] (s_(if|id|ex|me|wb)[0-9]_rs2;)/xpr_t \1/' core/t.v
sed -i -E 's/wire \[4:0\] (s_(if|id|ex|me|wb)[0-9]_rd[AB]?;)/xpr_t \1/' core/t.v

mv core/t.v core/superscalar_core_t.sv

rm $__DIR/src/core -rf
mv core $__DIR/src
find src/core -type f | sort
