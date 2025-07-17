module ImmDecode(

    input [31:0] inst,
    output reg [31:0] imm
);


always @(*)begin

    case(inst[6:0])

        7'b110111: begin
            // LUI
            imm = {inst[31:12], 12'b0};

        end

        7'b1100111: begin
            // JALR
            imm = {{20{inst[31]}}, inst[31:20]};

        end


        7'b10111: begin
            // AUIPC
            imm = {inst[31:12], 12'b0};

        end

        7'b1101111: begin
            // JAL
            imm = {{12{inst[31]}}, inst[19:12], inst[20], inst[30:21], 1'b0};

        end
        7'b100011: begin
            // SW
            imm = {{20{inst[31]}}, inst[31:25], inst[11:7]};

        end

        7'b1100011: begin
            // BLT
            imm = {{20{inst[31]}}, inst[7], inst[30:25], inst[11:8], 1'b0};

        end

        7'b10011: begin
            //                          SLLI                              SRLI, SRAI                              ADDI, SLTI
            //imm = (inst[14:12] == 001) ? {27'b0, inst[24:20]} : (inst[14:12] == 100) ? {27'b0, inst[24:20]} : {{20{inst[31]}}, inst[31:20]};
            imm = (inst[14:12] == 3'b000) ? {{20{inst[31]}}, inst[31:20]} : {27'b0, inst[24:20]};

        end

        default:
            // LW
            imm = {{20{inst[31]}}, inst[31:20]};

    endcase

end
endmodule
