module Forwarding(

    input [4:0] rs1, rs2, rs1ID, rs2ID,
    input [4:0] rdMEM, rdWB,
    input EscRegMEM, EscRegWB, lw, imm,
    output forwardingRs1WB, forwardingRs2WB, forwardingRs1MEM, forwardingRs2MEM, forwardingRs1ID, forwardingRs2ID

);

    assign forwardingRs1ID = ((rs1ID == rdWB) & !EscRegWB) ? 1'b1 : 1'b0;
    assign forwardingRs2ID = ((rs2ID == rdWB) & !EscRegWB) ? 1'b1 : 1'b0;

    assign forwardingRs1MEM = ((rs1 == rdMEM) & !EscRegMEM) ? 1'b1 : 1'b0;
    assign forwardingRs2MEM = ((rs2 == rdMEM) & !EscRegMEM) ? 1'b1 : 1'b0;

    assign forwardingRs1WB = ((rs1 == rdWB) & !EscRegWB) ? 1'b1 : 1'b0;
    assign forwardingRs2WB = ((rs2 == rdWB) & !EscRegWB) ? 1'b1 : 1'b0;

endmodule
