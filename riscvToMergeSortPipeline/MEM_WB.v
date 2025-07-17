module MEM_WB(

    input clk, reset,
    input [31:0] outAlu_jumpAdress, outMem, imm,
    input [4:0]  rd,
    input EscReg, lw, lui,
    output reg [31:0] outAlu_jumpAdressOut, outMemOut, immOut,
    output reg [4:0] rdOut,
    output reg EscRegOut, lwOut, luiOut

);


always @(posedge clk, posedge reset)

    begin
    if (reset)
        begin

        outAlu_jumpAdressOut <= 32'b0;
        outMemOut <= 32'b0;
        rdOut <= 5'b0;
        EscRegOut <= 1'b0;
        lwOut <= 1'b0;
        immOut <= 32'b0;
        luiOut <= 5'b0;

        end

    else
        begin

        outAlu_jumpAdressOut <= outAlu_jumpAdress;
        outMemOut <= outMem;
        rdOut <= rd;
        EscRegOut <= EscReg;
        lwOut <= lw;
        immOut <= imm;
        luiOut <= lui;

        end

    end
endmodule

