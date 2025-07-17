module ControlUnit(
    input  [31:0] inst,
    output reg EscReg, EscMem, ulaImm, jump, blt, bge, lui, auiPc, jalr, lw,
    output reg [2:0] aluControl
);

always @(*) begin
    // Valores padrão
    EscReg      = 0;
    EscMem      = 0;
    ulaImm      = 0;
    jump        = 0;
    blt         = 0;
    bge         = 0;
    lui         = 0;
    aluControl  = 'b000;
    auiPc       = 0;
    jalr        = 0;
    lw          = 0;

    case (inst[6:0])

        7'b110011: begin
            // ADD, SUB, OR
            EscReg = 0; //#
            EscMem = 0;
            ulaImm = 1; //#
            jump = 0;
            blt = 0;
            bge = 0;
            lui = 0;
            aluControl = inst[14:12];
            auiPc = 0;
            jalr = 0;
            lw = 0;

        end

        7'b10111: begin
            // AUIPC

            EscReg = 0; //#
            EscMem = 0;
            ulaImm = 0; //#
            jump = 0;
            blt = 0;
            bge = 0;
            lui = 0;
            aluControl = 000;
            auiPc = 1;
            jalr = 0;
            lw = 0;

        end

        7'b1101111: begin
            // JAL

            EscReg = 0; //#
            EscMem = 0;
            jump = 1;
            lui = 0;
            auiPc = 0;
            jalr = 0;
            lw = 0;

        end

        7'b1100111: begin
            // JALR

            EscReg = 0; //#
            EscMem = 0;
            ulaImm = 0; //#
            jump = 0;
            lui = 0;
            aluControl = inst[14:12];
            auiPc = 0;
            jalr = 1;
            lw = 0;

        end
        7'b100011: begin
            // SW

            EscReg = 1; //#
            EscMem = 1;
            ulaImm = 0; //#
            jump = 0;
            blt = 0;
            bge = 0;
            lui = 0;
            aluControl = 000;
            auiPc = 0;
            jalr = 0;
            lw = 0;

        end

        7'b1100011: begin
            // BLT

            EscReg = 1; //#
            EscMem = 0;
            ulaImm = 1; //#
            lui = 0;
            auiPc = 0;
            jump = 0;
            jalr = 0;
            aluControl = 3'b100;
            lw = 0;

            case(inst[12])

                1'b0: begin

                    blt = 1'b1;
                    bge = 1'b0;

                end

                1'b1: begin

                    blt = 1'b0;
                    bge = 1'b1;

                end

            endcase

        end

        7'b11: begin
            // LW

            EscReg = 0; //#
            EscMem = 0;
            ulaImm = 0; //#
            jump = 0;
            blt = 0;
            bge = 0;
            lui = 0;
            aluControl = 000;
            auiPc = 0;
            jalr = 0;
            lw = 1;

        end

        7'b10011: begin
            // ADDI, SLTI, SLLI, SRLI, SRAI

            EscReg = 0; //#
            EscMem = 0;
            ulaImm = 0; //#
            jump = 0;
            blt = 0;
            bge = 0;
            lui = 0;
            aluControl = inst[14:12];
            auiPc = 0;
            jalr = 0;
            lw = 0;

        end

        7'b110111: begin
            // LUI

            EscReg = 0; //#
            EscMem = 0;
            ulaImm = 0;
            jump = 0;
            blt = 0;
            bge = 0;
            lui = 1;
            auiPc = 0;
            jalr = 0;
            lw = 0;

        end

        default: begin
            // nop

            EscReg = 1; //#
            EscMem = 0;
            jump = 0;
            blt = 0;
            bge = 0;
            jalr = 0;
            lw = 0;

        end
    endcase
end
endmodule
