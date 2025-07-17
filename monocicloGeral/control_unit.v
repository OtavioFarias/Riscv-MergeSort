module control_unit(
    input  [31:0]inst,
    output reg EscReg, EscMem, ulaImm,
               jump, readMem, BranchTrue, BranchFalse, ulaPc, alum, byteMem, halfMem, wordMem, wordAlu, signalAlu, signalMem, escImm, auiPc, jalr,
    output reg [2:0]aluControl
);

always @(*) begin
    // Valores padrão
    EscReg      = 0;
    EscMem      = 0;
    ulaImm      = 0;
    jump        = 0;
    readMem     = 0;
    BranchTrue  = 0;
    BranchFalse = 0;
    ulaPc = 0;
    alum = 0;
    aluControl = 'b000;
    byteMem = 0;
    halfMem = 0;
    wordMem = 0;
    wordAlu = 0;
    signalAlu = 0;
    signalMem = 0;
    escImm = 0;
    auiPc = 0;
    jalr = 0;

    case (inst[6:0])
        7'b110011: begin
            // ADD, SUB, SLL, SLT, SLTU, XOR, SRL, SRA, OR, AND
            EscReg = 1;
            EscMem = 0;
            ulaImm = 0;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 0;
            alum = inst[30];
            aluControl = inst[14:12];
            wordAlu = 0;
            signalAlu = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

        end

        7'b111011: begin
            // ADDW, SUBW, SLLW, SRLW, SRAW

            EscReg = 1;
            EscMem = 0;
            ulaImm = 0;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 0;
            alum = inst[30];
            aluControl = inst[14:12];
            wordAlu = 1;
            signalAlu = 1;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

        end
        7'b0110111: begin
            // LUI

            EscReg = 1;
            EscMem = 0;
            ulaImm = 1;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            escImm = 1;
            auiPc = 0;
            jalr = 0;

        end

        7'b10111: begin
            // AUIPC

            EscReg = 1;
            EscMem = 0;
            ulaImm = 1;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 1;
            alum = 000;
            aluControl = 1;
            byteMem = 0;
            halfMem = 0;
            wordMem = 0;
            wordAlu = 0;
            signalAlu = 0;
            signalMem = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

        end
        7'b1101111: begin
            // JAL arumar o salvar

            EscReg = 1;
            EscMem = 0;
            jump = 1;
            readMem = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

        end
        7'b1100111: begin
                    // JALR

            EscReg = 1;
            EscMem = 0;
            ulaImm = 1;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 1;
            alum = 0;
            aluControl = 000;
            wordAlu =  0;
            signalAlu = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

        end
        7'b100011: begin
            // SB,SH, SW, SD

            EscReg = 0;
            EscMem = 1;
            ulaImm = 1;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 0;
            alum = 0;
            aluControl = 000;;
            byteMem = (inst[14:12] == 'b000) ? 1 : 0;
            halfMem = (inst[14:12] == 'b001) ? 1 : 0;
            wordMem = (inst[14:12] == 'b010) ? 1 : 0;
            wordAlu = 0;
            signalMem = 1;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

        end
        7'b1100011: begin
            // BEQ, BNE, BLT, BGE, BLTU, BGEU, JALR

            EscReg = 0;
            EscMem = 0;
            ulaImm = 0;
            readMem = 0;
            ulaPc = 0;
            wordAlu = 0;
            signalAlu = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;


            case(inst[14:12])

                3'b000: begin
                    BranchTrue = 1'b1;
                    BranchFalse = 1'b0;
                    aluControl = 3'b000;
                    alum = 'b1;

                end

                3'b001: begin
                    BranchTrue = 1'b0;
                    BranchFalse = 1'b1;
                    aluControl = 3'b000;
                    alum = 'b1;

                end

                3'b100: begin
                    BranchTrue = 1'b1;
                    BranchFalse = 1'b0;
                    aluControl = 3'b010;

                end

                3'b101: begin
                    BranchTrue = 1'b0;
                    BranchFalse = 1'b1;
                    aluControl = 3'b010;

                end

                3'b110: begin
                    BranchTrue = 1'b1;
                    BranchFalse = 1'b0;
                    aluControl = 3'b011;

                end

                default: begin
                    BranchTrue = 1'b0;
                    BranchFalse = 1'b1;
                    aluControl = 3'b011;

                end

            endcase


        end
        7'b11: begin
            // LB, LH, LW, LBU, LHU, LWU, LD

            EscReg = 1;
            EscMem = 0;
            ulaImm = 1;
            jump = 0;
            readMem = 1;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 0;
            alum = 0;
            aluControl = 000;
            wordAlu = 0;
            signalAlu = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;

            case(inst[14:12])

                3'b000: begin

                    byteMem = 1;
                    halfMem = 0;
                    wordMem = 0;
                    signalMem = 1;

                end

                3'b001: begin

                    byteMem = 0;
                    halfMem = 1;
                    wordMem = 0;
                    signalMem = 1;

                end

                3'b010: begin

                    byteMem = 0;
                    halfMem = 0;
                    wordMem = 1;
                    signalMem = 1;


                end


                3'b011: begin

                    byteMem = 0;
                    halfMem = 0;
                    wordMem = 0;
                    signalMem = 0;

                end


                3'b100: begin

                    byteMem = 1;
                    halfMem = 0;
                    wordMem = 0;
                    signalMem = 0;


                end

            3'b101: begin

                    byteMem = 0;
                    halfMem = 1;
                    wordMem = 0;
                    signalMem = 0;

                end



            3'b110: begin

                    byteMem = 0;
                    halfMem = 0;
                    wordMem = 1;
                    signalMem = 0;

                end
            endcase
        end

        7'b10011: begin
            // ADDI, SLTI, SLTIU, XORI, ORI, ANDI, SLLI, SRLI, SRAI

            EscReg = 1;
            EscMem = 0;
            ulaImm = 1;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 0;
            alum = inst[30];
            aluControl = inst[14:12];
            wordAlu = 0;
            signalAlu = 0;
            escImm = 0;
            auiPc = 0;
            jalr = 0;


        end
        7'b11011: begin
            // ADDIW, SLLIW, SRLIW, SRAIW

            EscReg = 1;
            EscMem = 0;
            ulaImm = 1;
            jump = 0;
            readMem = 0;
            BranchTrue = 0;
            BranchFalse = 0;
            ulaPc = 0;
            alum = inst[30];
            aluControl = inst[14:12];
            wordAlu = 1;
            signalAlu = 1;
            escImm = 0;
            auiPc = 0;
            jalr = 0;


        end
        default: begin
            // Nenhuma instrução reconhecida
        end
    endcase
end
endmodule
