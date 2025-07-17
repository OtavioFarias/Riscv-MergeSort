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

    reg [31:0]reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;

    assign outReg1 = rs1 == 5'b00000 ? 32'b0 :
                     rs1 == 5'b00001 ? reg1 :
                     rs1 == 5'b00010 ? reg2 :
                     rs1 == 5'b00011 ? reg3 :
                     rs1 == 5'b00100 ? reg4 :
                     rs1 == 5'b00101 ? reg5 :
                     rs1 == 5'b00110 ? reg6 :
                     rs1 == 5'b00111 ? reg7 :
                     rs1 == 5'b01000 ? reg8 :
                     rs1 == 5'b01001 ? reg9 :
                     rs1 == 5'b01010 ? reg10 :
                     rs1 == 5'b01011 ? reg11 :
                     rs1 == 5'b01100 ? reg12 :
                     rs1 == 5'b01101 ? reg13 :
                     rs1 == 5'b01110 ? reg14 :
                     rs1 == 5'b01111 ? reg15 :
                     rs1 == 5'b10000 ? reg16 :
                     rs1 == 5'b10001 ? reg17 :
                     rs1 == 5'b10010 ? reg18 :
                     rs1 == 5'b10011 ? reg19 :
                     rs1 == 5'b10100 ? reg20 :
                     rs1 == 5'b10101 ? reg21 :
                     rs1 == 5'b10110 ? reg22 :
                     rs1 == 5'b10111 ? reg23 :
                     rs1 == 5'b11000 ? reg24 :
                     rs1 == 5'b11001 ? reg25 :
                     rs1 == 5'b11010 ? reg26 :
                     rs1 == 5'b11011 ? reg27 :
                     rs1 == 5'b11100 ? reg28 :
                     rs1 == 5'b11101 ? reg29 :
                     rs1 == 5'b11110 ? reg30 :
                                       reg31;

    assign outReg2 = rs2 == 5'b00000 ? 32'b0 :
                     rs2 == 5'b00001 ? reg1 :
                     rs2 == 5'b00010 ? reg2 :
                     rs2 == 5'b00011 ? reg3 :
                     rs2 == 5'b00100 ? reg4 :
                     rs2 == 5'b00101 ? reg5 :
                     rs2 == 5'b00110 ? reg6 :
                     rs2 == 5'b00111 ? reg7 :
                     rs2 == 5'b01000 ? reg8 :
                     rs2 == 5'b01001 ? reg9 :
                     rs2 == 5'b01010 ? reg10 :
                     rs2 == 5'b01011 ? reg11 :
                     rs2 == 5'b01100 ? reg12 :
                     rs2 == 5'b01101 ? reg13 :
                     rs2 == 5'b01110 ? reg14 :
                     rs2 == 5'b01111 ? reg15 :
                     rs2 == 5'b10000 ? reg16 :
                     rs2 == 5'b10001 ? reg17 :
                     rs2 == 5'b10010 ? reg18 :
                     rs2 == 5'b10011 ? reg19 :
                     rs2 == 5'b10100 ? reg20 :
                     rs2 == 5'b10101 ? reg21 :
                     rs2 == 5'b10110 ? reg22 :
                     rs2 == 5'b10111 ? reg23 :
                     rs2 == 5'b11000 ? reg24 :
                     rs2 == 5'b11001 ? reg25 :
                     rs2 == 5'b11010 ? reg26 :
                     rs2 == 5'b11011 ? reg27 :
                     rs2 == 5'b11100 ? reg28 :
                     rs2 == 5'b11101 ? reg29 :
                     rs2 == 5'b11110 ? reg30 :
                                       reg31;


always @(posedge clock, posedge reset)
    begin
    if (reset)
        begin

        reg1 <= 32'b0;
        reg2 <= 32'b0;
        reg3 <= 32'b0;
        reg4 <= 32'b0;
        reg5 <= 32'b0;
        reg6 <= 32'b0;
        reg7 <= 32'b0;
        reg8 <= 32'b0;
        reg9 <= 32'b0;
        reg10 <= 32'b0;
        reg11 <= 32'b0;
        reg12 <= 32'b0;
        reg13 <= 32'b0;
        reg14 <= 32'b0;
        reg15 <= 32'b0;
        reg16 <= 32'b0;
        reg17 <= 32'b0;
        reg18 <= 32'b0;
        reg19 <= 32'b0;
        reg20 <= 32'b0;
        reg21 <= 32'b0;
        reg22 <= 32'b0;
        reg23 <= 32'b0;
        reg24 <= 32'b0;
        reg25 <= 32'b0;
        reg26 <= 32'b0;
        reg27 <= 32'b0;
        reg28 <= 32'b0;
        reg29 <= 32'b0;
        reg30 <= 32'b0;
        reg31 <= 32'b0;

    end else
        begin

        if(regWrite == 0)
            begin

            case(rd)

                5'b00001 : reg1 <= writeData;
                5'b00010 : reg2 <= writeData;
                5'b00011 : reg3 <= writeData;
                5'b00100 : reg4 <= writeData;
                5'b00101 : reg5 <= writeData;
                5'b00110 : reg6 <= writeData;
                5'b00111 : reg7 <= writeData;
                5'b01000 : reg8 <= writeData;
                5'b01001 : reg9 <= writeData;
                5'b01010 : reg10 <= writeData;
                5'b01011 : reg11 <= writeData;
                5'b01100 : reg12 <= writeData;
                5'b01101 : reg13 <= writeData;
                5'b01110 : reg14 <= writeData;
                5'b01111 : reg15 <= writeData;
                5'b10000 : reg16 <= writeData;
                5'b10001 : reg17 <= writeData;
                5'b10010 : reg18 <= writeData;
                5'b10011 : reg19 <= writeData;
                5'b10100 : reg20 <= writeData;
                5'b10101 : reg21 <= writeData;
                5'b10110 : reg22 <= writeData;
                5'b10111 : reg23 <= writeData;
                5'b11000 : reg24 <= writeData;
                5'b11001 : reg25 <= writeData;
                5'b11010 : reg26 <= writeData;
                5'b11011 : reg27 <= writeData;
                5'b11100 : reg28 <= writeData;
                5'b11101 : reg29 <= writeData;
                5'b11110 : reg30 <= writeData;
                default  : reg31 <= writeData;

            endcase
            end
        end
    end
endmodule
