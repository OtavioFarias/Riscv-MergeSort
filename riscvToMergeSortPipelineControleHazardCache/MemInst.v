module MemInst(
    input [31:0] address,
    output reg [31:0] outInst,
    input clock,
    output reg hit
);

    wire [31:0] outRAM;
    wire [6:0] index;
    wire [25:0] tag;

    assign index = address[6:0];
    assign tag = address[31:7];

    reg [31:0] inst[0:127];
    reg valid[0:127];
    reg [25:0] tagArray[0:127];

    // Supondo que a RAM já entregue os dados corretos
    RAM ram (
        .address(address),
        .data(outRAM),
        .clock(clock)
    );

    always @(posedge clock) begin
        if (valid[index] && tag == tagArray[index]) begin
            outInst <= inst[index];
            hit <= 1'b1;
        end else begin
            hit <= 1'b0;
            inst[index] <= outRAM;
            tagArray[index] <= tag;
            valid[index] <= 1'b1;
        end
    end

endmodule
