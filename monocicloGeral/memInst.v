module memInst(
    input [63:0] pc,          // endereço de instrução (program counter)
    output [31:0] out_inst,   // saída de instrução (16 bits)
    input clock
);


    // Memória de instruções (256 posições, 16 bits cada)
    reg [31:0] inst [0:255];

    // Inicialização das memórias

    initial begin
    inst[0] = 32'b00000000000100000000000100010011; //addi 2 0 1
    inst[1] = 32'b00000000001000000000000010010011; //add 1 0 2
    inst[2] = 32'b01000000001000001000000110110011; //sub 3 2 1
    inst[3] = 32'b00000000000100011011000000100011; // sd 3 1 0
    inst[4] = 32'b00000000000100011011001110000011; // ld
    inst[5] = 32'b00000000000000011000001101100011;//beg false
    inst[6] = 32'b00000000000000000000001101100011; //beg true
    inst[9] = 32'b000000001010_00001_000_11111_1100111; //jalr 2 + 10
    inst[12] = 32'b00000000000000000001_00111_0010111; //aui pc +1, 7
    inst[13] = 32'b11000000000000000001_11111_0110111; //lui 11...00001 11




        // ... (inicialize o restante das posições com 0)

        // Instruções já fornecidas

        // ... (inicialize o restante das instruções com 0)
    end

    assign out_inst = inst[pc];     // Saída de instrução

endmodule
