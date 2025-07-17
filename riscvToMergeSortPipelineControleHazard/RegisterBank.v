module RegisterBank(

    input [4:0]rs1,
    input [4:0]rs2,
    input [4:0]rd,
    input regWrite,
    input reset,
    input clock,
    input [31:0]writeData,
    output [31:0]outReg1,
    output [31:0]outReg2

);

    reg [31:0]reg1_ra, reg2_sp, reg3_gp, reg4_tp, reg5_t0, reg6_t1, reg7_t2, reg8_s0, reg9_s1, reg10_a0, reg11_a1, reg12_a2, reg13_a3, reg14_a4, reg15_a5, reg16_a6, reg17_a7, reg18_s2, reg19_s3, reg20_s4, reg21_s5, reg22_s6,reg23_s7, reg24_s8, reg25_s9, reg26_s10, reg27_s11, reg28_t3, reg29_t4,reg30_t5, reg31_t6;

    assign outReg1 = rs1 == 5'b00000 ? 32'b0 :
                     rs1 == 5'b00001 ? reg1_ra :
                     rs1 == 5'b00010 ? reg2_sp :
                     rs1 == 5'b00011 ? reg3_gp :
                     rs1 == 5'b00100 ? reg4_tp :
                     rs1 == 5'b00101 ? reg5_t0 :
                     rs1 == 5'b00110 ? reg6_t1 :
                     rs1 == 5'b00111 ? reg7_t2 :
                     rs1 == 5'b01000 ? reg8_s0 :
                     rs1 == 5'b01001 ? reg9_s1 :
                     rs1 == 5'b01010 ? reg10_a0 :
                     rs1 == 5'b01011 ? reg11_a1 :
                     rs1 == 5'b01100 ? reg12_a2 :
                     rs1 == 5'b01101 ? reg13_a3 :
                     rs1 == 5'b01110 ? reg14_a4 :
                     rs1 == 5'b01111 ? reg15_a5 :
                     rs1 == 5'b10000 ? reg16_a6 :
                     rs1 == 5'b10001 ? reg17_a7 :
                     rs1 == 5'b10010 ? reg18_s2 :
                     rs1 == 5'b10011 ? reg19_s3 :
                     rs1 == 5'b10100 ? reg20_s4 :
                     rs1 == 5'b10101 ? reg21_s5 :
                     rs1 == 5'b10110 ? reg22_s6 :
                     rs1 == 5'b10111 ? reg23_s7 :
                     rs1 == 5'b11000 ? reg24_s8 :
                     rs1 == 5'b11001 ? reg25_s9 :
                     rs1 == 5'b11010 ? reg26_s10 :
                     rs1 == 5'b11011 ? reg27_s11 :
                     rs1 == 5'b11100 ? reg28_t3 :
                     rs1 == 5'b11101 ? reg29_t4 :
                     rs1 == 5'b11110 ? reg30_t5 :
                                       reg31_t6;

    assign outReg2 = rs2 == 5'b00000 ? 32'b0 :
                     rs2 == 5'b00001 ? reg1_ra :
                     rs2 == 5'b00010 ? reg2_sp :
                     rs2 == 5'b00011 ? reg3_gp :
                     rs2 == 5'b00100 ? reg4_tp :
                     rs2 == 5'b00101 ? reg5_t0 :
                     rs2 == 5'b00110 ? reg6_t1 :
                     rs2 == 5'b00111 ? reg7_t2 :
                     rs2 == 5'b01000 ? reg8_s0 :
                     rs2 == 5'b01001 ? reg9_s1 :
                     rs2 == 5'b01010 ? reg10_a0 :
                     rs2 == 5'b01011 ? reg11_a1 :
                     rs2 == 5'b01100 ? reg12_a2 :
                     rs2 == 5'b01101 ? reg13_a3 :
                     rs2 == 5'b01110 ? reg14_a4 :
                     rs2 == 5'b01111 ? reg15_a5 :
                     rs2 == 5'b10000 ? reg16_a6 :
                     rs2 == 5'b10001 ? reg17_a7 :
                     rs2 == 5'b10010 ? reg18_s2 :
                     rs2 == 5'b10011 ? reg19_s3 :
                     rs2 == 5'b10100 ? reg20_s4 :
                     rs2 == 5'b10101 ? reg21_s5 :
                     rs2 == 5'b10110 ? reg22_s6 :
                     rs2 == 5'b10111 ? reg23_s7 :
                     rs2 == 5'b11000 ? reg24_s8 :
                     rs2 == 5'b11001 ? reg25_s9 :
                     rs2 == 5'b11010 ? reg26_s10 :
                     rs2 == 5'b11011 ? reg27_s11 :
                     rs2 == 5'b11100 ? reg28_t3 :
                     rs2 == 5'b11101 ? reg29_t4 :
                     rs2 == 5'b11110 ? reg30_t5 :
                                       reg31_t6;


always @(posedge clock, posedge reset)
    begin
    if (reset)
        begin

        reg1_ra <= 32'b0;
        reg2_sp <= 32'b00000000000000000000000100000000;
        reg3_gp <= 32'b0;
        reg4_tp <= 32'b0;
        reg5_t0 <= 32'b0;
        reg6_t1 <= 32'b0;
        reg7_t2 <= 32'b0;
        reg8_s0 <= 32'b0;
        reg9_s1 <= 32'b0;
        reg10_a0 <= 32'b0;
        reg11_a1 <= 32'b0;
        reg12_a2 <= 32'b0;
        reg13_a3 <= 32'b0;
        reg14_a4 <= 32'b0;
        reg15_a5 <= 32'b0;
        reg16_a6 <= 32'b0;
        reg17_a7 <= 32'b0;
        reg18_s2 <= 32'b0;
        reg19_s3 <= 32'b0;
        reg20_s4 <= 32'b0;
        reg21_s5 <= 32'b0;
        reg22_s6 <= 32'b0;
        reg23_s7 <= 32'b0;
        reg24_s8 <= 32'b0;
        reg25_s9 <= 32'b0;
        reg26_s10 <= 32'b0;
        reg27_s11 <= 32'b0;
        reg28_t3 <= 32'b0;
        reg29_t4 <= 32'b0;
        reg30_t5 <= 32'b0;
        reg31_t6 <= 32'b0;

    end else
        begin

        if(regWrite == 0)
            begin

            case(rd)

                5'b00001 : reg1_ra <= writeData;
                5'b00010 : reg2_sp <= writeData;
                5'b00011 : reg3_gp <= writeData;
                5'b00100 : reg4_tp <= writeData;
                5'b00101 : reg5_t0 <= writeData;
                5'b00110 : reg6_t1 <= writeData;
                5'b00111 : reg7_t2 <= writeData;
                5'b01000 : reg8_s0 <= writeData;
                5'b01001 : reg9_s1 <= writeData;
                5'b01010 : reg10_a0 <= writeData;
                5'b01011 : reg11_a1 <= writeData;
                5'b01100 : reg12_a2 <= writeData;
                5'b01101 : reg13_a3 <= writeData;
                5'b01110 : reg14_a4 <= writeData;
                5'b01111 : reg15_a5 <= writeData;
                5'b10000 : reg16_a6 <= writeData;
                5'b10001 : reg17_a7 <= writeData;
                5'b10010 : reg18_s2 <= writeData;
                5'b10011 : reg19_s3 <= writeData;
                5'b10100 : reg20_s4 <= writeData;
                5'b10101 : reg21_s5 <= writeData;
                5'b10110 : reg22_s6 <= writeData;
                5'b10111 : reg23_s7 <= writeData;
                5'b11000 : reg24_s8 <= writeData;
                5'b11001 : reg25_s9 <= writeData;
                5'b11010 : reg26_s10 <= writeData;
                5'b11011 : reg27_s11 <= writeData;
                5'b11100 : reg28_t3 <= writeData;
                5'b11101 : reg29_t4 <= writeData;
                5'b11110 : reg30_t5 <= writeData;
                default  : reg31_t6 <= writeData;

            endcase
            end
        end
    end
endmodule
