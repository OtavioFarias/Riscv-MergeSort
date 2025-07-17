module RAM1(

    input [31:0] address,
    input [31:0] value,
    output [31:0] data,
    input write,
    input clock

);

    reg [7:0] memory[0:1171];

    initial begin

        $readmemb("inst4elementos.txt", memory);

    end

    assign data = {memory[address], memory[address+1], memory[address+2], memory[address+3]};

    always @(posedge clock) begin

        if(write) begin

            memory[address] = value[31:24];
            memory[address + 1] = value[23:16];
            memory[address + 2] = value[15:8];
            memory[address + 3] = value[7:0];

        end

    end

endmodule
