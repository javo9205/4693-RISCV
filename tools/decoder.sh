#!/bin/bash

color() { echo -e "\e[$1m$2\e[0m"; }

table() {
    no_fmt="$(echo $3 | sed "s/$(echo -e "\e")[^m]*m//g")"
    stretch=$((20-${#no_fmt}))
    padding="                                                        "
    padding=${padding:0:$stretch}
    assembly="$3$padding"
    printf '%s%10s | %s | %1s | %07s | %03s | %07s | %4s | %s\n' "$1" "$2" "$assembly" "$4" "$5" "$6" "$7" "$8" "$9"
}


i_parse() { echo ${instr:$1:$(($2 - $1 + 1))} | rev; }

to_reg() { echo "x$(echo "obase=10; ibase=2; $1" | bc)"; }

to_fmt() {
    case "$1" in
        "0110011") echo "R";;
        "0010011") echo "I";;
        "0000011") echo "I";;
        "0100011") echo "S";;
        "1100011") echo "B";;
        "1101111") echo "J";;
        "1100111") echo "I";;
        "0110111") echo "U";;
        "0010111") echo "U";;
        "1110011") echo "I";;
        *)echo " ";;
    esac
}

to_immed() {
    case $1 in
        R) echo 0;;
        I) echo "$(i_parse 20 31)";;
        S) echo "$(i_parse 25 31)$(i_parse 7 11)";;
        B) echo "${instr[31]}${instr[7]}$(i_parse 25 30)$(i_parse 8 11)0";;
        U) echo "$(i_parse 12 31)";;
        J) echo "${instr[31]}$(i_parse 12 19)${instr[20]}$(i_parse 21 30)";;
    esac
}

to_raw() {
    for byte in $(echo $1 | sed -E 's/(..)(..)(..)(..)/\4 \3 \2 \1/g'); do
        byte=$((16#$byte))
        if [[ "$byte" -gt 31 ]] && [[ "$byte" -lt 127 ]]; then
            printf '%b' $(printf '\\%03o' $byte)
        else
            echo -n "."
        fi
    done
}

decode() {
    is_bin=$(echo $1 | grep -cE ^[01]{32}$)
    is_hex=$(echo $1 | grep -cE ^[0-9A-Fa-f]{8}$)
    if [ $is_bin -eq 1 ]; then
        instr=$1
    elif [ $is_hex -eq 1 ]; then
        instr=$(printf %32s $(echo "obase=2; ibase=16; ${1^^}" | bc) | sed 's/ /0/g')
    else
        instr="!"
        return -1
    fi

    instr=$(i_parse 0 31)
    opcode=$(i_parse 0 6)
    funct3=$(i_parse 12 14)
    funct7=$(i_parse 25 31)
    rd=$(to_reg  $(i_parse 7 11))
    rs1=$(to_reg $(i_parse 15 19))
    rs2=$(to_reg $(i_parse 20 24))
    fmt=$(to_fmt $opcode)
    imm=$(to_immed $fmt) # Magenta
    immed=$(color 35 "0x$(echo "obase=16; ibase=2; $imm" | bc)")
    instr=$(printf %08x $(echo "obase=10; ibase=2; $(i_parse 0 31)" | bc))
    asm="--------------------"
    op="[!]"
    desc=""
    raw=$(to_raw $instr)
    
    case $fmt in
        R)
            case "$funct3$funct7" in
                0000000000) op=add;  desc="rd = rs1 + rs2";;
                0000100000) op=sub;  desc="rd = rs1 - rs2";;
                1000000000) op=xor;  desc="rd = rs1 ^ rs2";;
                1100000000) op=or;   desc="rd = rs1 | rs2";;
                1110000000) op=and;  desc="rd = rs1 & rs2";;
                0010000000) op=sll;  desc="rd = rs1 << rs2";;
                1010000000) op=srl;  desc="rd = rs1 >> rs2";;
                1010100000) op=sra;  desc="rd = rs1 >> rs2";;
                0100000000) op=slt;  desc="rd = (rs1 < rs2)";;
                0110000000) op=sltu; desc="rd = (rs1 < rs2)";;
            esac
            # Light Blue
            op=$(color 94 $op)
            asm="$op $rd, $rs1, $rs2";;
        I)
            case "$opcode" in
                0010011)
                    case "$funct3" in
                        000) op=addi; desc="rd = rs1 + imm";;
                        100) op=xori; desc="rd = rs1 ^ imm";;
                        110) op=ori;  desc="rd = rs1 | imm";;
                        111) op=andi; desc="rd = rs1 & imm";;
                        001) op=slli; desc="rd = rs1 << imm[0:4]"
                             immed="0x$(echo "obase=16; ibase=2; ${imm:7:5}" | bc)";;
                        101)
                            case ${imm:1:1} in
                                0) op=srli; desc="rd = rs1 >> imm[0:4]";;
                                1) op=srai; desc="rd = rs1 >> imm[0:4]";;
                            esac
                             immed="0x$(echo "obase=16; ibase=2; ${imm:7:5}" | bc)";;
                        010) op=slti;  desc="rd = (rs1 < imm)";;
                        011) op=sltiu; desc="rd = (rs1 < imm)";;
                    esac
                    # Cyan
                    op=$(color 36 $op)
                    asm="$op $rd, $rs1, $immed";;
                0000011)
                    case "$funct3" in
                        000) op=lb;  desc="rd = M[rs1+imm][0:7]";;
                        001) op=lh;  desc="rd = M[rs1+imm][0:15]";;
                        010) op=lw;  desc="rd = M[rs1+imm][0:31]";;
                        100) op=lbu; desc="rd = M[rs1+imm][0:7]";;
                        101) op=lhu; desc="rd = M[rs1+imm][0:15]";;
                    esac
                    # Green
                    op=$(color 32 $op)
                    asm="$op $rd $immed($rs1)";;
                1100111) op=$(color 95 jalr); desc="rd = PC+4; PC=rs1 + imm"
                         asm="$op $rd, $immed($rs1)";;
                1110011) op=$( [[ $imm -eq 0 ]] && echo ecall || echo ebreak )
                         asm=$(color 31 $op);;
            esac;;
        S)
            case "$funct3" in
                000) op=sb; desc="M[rs1+imm][0:1] = rs2[0:1]";;
                001) op=sh; desc="M[rs1+imm][0:15] = rs2[0:15]";;
                010) op=sw; desc="M[rs1+imm][0:31] = rs2[0:31]";;
            esac
            # Light Green
            op=$(color 92 $op)
            asm="$op $rs2 $immed($rs1)";;
        B)
            case "$funct3" in
                000) op=beq;  desc="if (rs1 == rs2) PC += imm";;
                001) op=bne;  desc="if (rs1 != rs2) PC += imm";;
                100) op=blt;  desc="if (rs1 <  rs2) PC += imm";;
                101) op=bge;  desc="if (rs1 >= rs2) PC += imm";;
                110) op=bltu; desc="if (rs1 <  rs2) PC += imm";;
                111) op=bgeu; desc="if (rs1 >= rs2) PC += imm";;
            esac
            # Light Yellow
            op=$(color 33 $op)
            asm="$op $rs1, $rs2, $immed";;
        U)
            case "$opcode" in
                0110111) op=lui;   desc="rd = imm << 12";;
                0010111) op=auipc; desc="rd = PC + (imm << 12)";;
            esac
            # Gray
            op=$(color 90 $op)
            asm="$op $rd, $immed";;
        J)  op=jal; desc="rd = PC+4; PC += imm";
            asm=$(echo -e "\e[35mjal\e[0m $rd, $immed");;
    esac

    if [[ $instr == "00000013" ]]; then asm="NOP"
    elif [[ "$desc" == "" ]]; then
        if [[ $opcode == "0111111" ]]; then
            asm="----------- $(color 91 HALT) ---"
            desc="[!] Codasip Exit Function"
            fmt="X"
        fi
    fi

    table "$2" "0x$instr" "$asm" "$fmt" $opcode $funct3 $funct7 "$raw" "$desc"
}

pc_to_line_num() {
    if [[ -z $STARTING_PC ]]; then echo 0
    else echo $(($(echo "obase=10; ibase=16; $STARTING_PC" | bc) / 4))
    fi
}

if [[ -z "$1" ]]; then
    n=0
    j=$(pc_to_line_num)
    i=$((j*4))
    if [[ $j -gt 0 ]]; then
        while read -r line; do if [[ $n -lt $j ]]; then n=$((n+1)); else break; fi; done
    fi
    table "  PC  : " " Instruction" "Assembly" "T" "Opcode" "FN3" "  FN7  " "RAW" "Description"
    echo -------------------------------------------------------------------------------------------------------
    while read -r line; do
        decode $line "$(printf '0x%04x: ' $i)"
        i=$((i+4))
        j=$((j+1))
        [[ $instr == "!" ]] && echo Invalid input at line $j: $line
    done

elif [[ -f "$1" ]]; then
    j=$(pc_to_line_num)
    i=$((j*4))
    table "  PC  : " " Instruction" "Assembly" "T" "Opcode" "FN3" "  FN7  " "RAW" "Description"
    echo -------------------------------------------------------------------------------------------------------
    for line in $(tail -n +$((j+1)) $1); do
        decode $line "$(printf '0x%04x: ' $i)"
        i=$((i+4))
        j=$((j+1))
        [[ $instr == "!" ]] && echo Invalid input at line $j: $line
    done

else
    for x in $@; do
        decode $x
        [[ $instr == "!" ]] && echo Invalid input: $x
    done
fi

