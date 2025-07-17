module IF_ID(

    input clk, reset,
    input [31:0] pc, pcAdd4, inst,
    output reg [31:0] pcOut, pcAdd4Out, instOut

);

always @(posedge clk, posedge reset)

    begin
    if (reset)
        begin

        pcOut <= 32'b0;
        pcAdd4Out <= 32'b0;
        instOut <= 32'b0;
        end

    else
        begin

        pcOut <= pc;
        pcAdd4Out <= pcAdd4;
        instOut <= inst;
        end

    end
endmodule
