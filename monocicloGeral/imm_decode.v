module imm_decode(

    input [31:0]inst,
    input [2:0]funct3,
    output reg [63:0]imm
);

always @(*)begin

    case(inst[6:0])

        7'b110111: begin
            // LUI
            imm = {inst[31:12], 12'b0};

        end

        7'b1100111: begin
            // JALR
            imm = {20'b0, inst[31:20]};

        end


        7'b10111: begin
            // AUIPC
            imm = {12'b0, inst[31:12]};

        end

        7'b1101111: begin
            // JAL
            imm = {11'b0, inst[31], inst[20], inst[19:12], inst[30:21]};

        end
        7'b100011: begin
            // SB,SH, SW, SD
            imm = {52'b0, inst[31:25], inst[11:7]};

        end

        7'b1100011: begin
            // BEQ, BNE, BLT, BGE, BLTU, BGEU, JALR
            imm = {47'b0, inst[31], inst[7], inst[30:25], inst[11:8]};

        end
        7'b11: begin
            // LB, LH, LW, LBU, LHU, LWU, LD
            imm = {52'b0, inst[31:20]};

        end
        7'b10011: begin
            //                          SLLI                              SRLI, SRAI            ADDI, SLTI, SLTIU, XORI, ORI, ANDI
            imm = (funct3 == 001) ? {59'b0, inst[24:20]} : (funct3 == 101) ? {59'b0, inst[24:20]} : {{52{inst[31]}}, inst[31:20]};

        end
        7'b11011: begin
                                    //ADDIW                 SLLIW, SRLIW, SRAIW
            imm = (funct3 == 000) ? {52'b0, inst[31:20]}  : {57'b0, inst[24:20]};

        end
        default: begin
            // Nenhuma instrução reconhecida
        end
    endcase
end
endmodule
