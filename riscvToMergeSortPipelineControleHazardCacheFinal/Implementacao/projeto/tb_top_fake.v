
module RAM(

    input [31:0] address,
    input [31:0] value,
    output wire [31:0] data,
    input write,
    input clock, reset,
    output wire stallSignal,
    input read

);

assign data = 32'b0;
assign stallSignal = 1'b0;

endmodule
