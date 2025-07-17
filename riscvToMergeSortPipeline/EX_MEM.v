module EX_MEM(

    input clk, reset,
    input [31:0] rs2, immPc, pcAdd4, outAlu, imm,
    input [4:0] rd,
    input EscReg, EscMem, jump, Branch, lui, jalr, lw,
    output reg [31:0] rs2Out, immPcOut, pcAdd4Out, outAluOut, immOut,
    output reg [4:0] rdOut,
    output reg EscRegOut, EscMemOut, jumpOut, BranchOut, luiOut, jalrOut, lwOut

);

always @(posedge clk, posedge reset)

    begin
    if (reset)
        begin

        rs2Out <= 32'b0;
        immPcOut <= 32'b0;
        rdOut <= 5'b0;
        pcAdd4Out <= 32'b0;
        outAluOut <= 32'b0;
        EscRegOut <= 1'b0;
        EscMemOut <= 1'b0;
        jumpOut <= 1'b0;
        BranchOut <= 1'b0;
        luiOut <= 1'b0;
        jalrOut <= 1'b0;
        lwOut <= 1'b0;
        immOut <= 32'b0;

        end

    else
        begin

        rs2Out <= rs2;
        immPcOut <= immPc;
        rdOut <= rd;
        pcAdd4Out <= pcAdd4;
        outAluOut <= outAlu;
        EscRegOut <= EscReg;
        EscMemOut <= EscMem;
        jumpOut <= jump;
        BranchOut <= Branch;
        luiOut <= lui;
        jalrOut <= jalr;
        lwOut <= lw;
        immOut <= imm;

        end

    end
endmodule
