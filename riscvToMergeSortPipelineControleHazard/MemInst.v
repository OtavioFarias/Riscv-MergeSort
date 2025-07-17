module MemInst(
    input [31:0] pc,          // endereço de instrução (program counter)
    output [31:0] out_inst,   // saída de instrução (16 bits)
    input clock,
    input stall
);


    // Memória de instruções (256 posições, 8 bits cada)
    reg [7:0] inst [0:1155];

    // Inicialização das memórias

    initial begin

        $readmemb("inst4elementos.txt", inst);

    end

        assign out_inst = (stall == 0) ? {inst[pc], inst[pc+1], inst[pc+2], inst[pc+3]} : 32'b0;     // Saída de instrução

endmodule
