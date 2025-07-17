module EX_MEM(

    input clk, reset,
    input [31:0] rs2, immPc, pcAdd4, outAlu, imm,
    input [4:0] rd,
    input EscReg, EscMem, jump, blt, bge, jalr, lw,
    output reg [31:0] rs2Out, immPcOut, pcAdd4Out, outAluOut, immOut,
    output reg [4:0] rdOut,
    output reg EscRegOut, EscMemOut, jumpOut, bltOut, bgeOut, jalrOut, lwOut,
    input flush

);

always @(posedge clk, posedge reset)

    begin
    if (reset | flush)
        begin

        rs2Out <= 32'b0;
        immPcOut <= 32'b0;
        rdOut <= 5'b0;
        pcAdd4Out <= 32'b0;
        outAluOut <= 32'b0;
        EscRegOut <= 1'b1;
        EscMemOut <= 1'b0;
        jumpOut <= 1'b0;
        bltOut <= 1'b0;
        bgeOut <= 1'b0;
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
        bltOut <= blt;
        bgeOut <= bge;
        jalrOut <= jalr;
        lwOut <= lw;
        immOut <= imm;

        end

    end
endmodule
