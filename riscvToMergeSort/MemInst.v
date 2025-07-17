module MemInst(
    input [31:0] pc,          // endereço de instrução (program counter)
    output [31:0] out_inst,   // saída de instrução (16 bits)
    input clock
);


    // Memória de instruções (256 posições, 16 bits cada)
    reg [7:0] inst [0:255];

    // Inicialização das memórias

    initial begin //addi,add,sub,jalr e jal(nsalva pc atual, não anterior), sll, or, sra, srl, blt, auipc, lui, lw, sw
    //inst[0] = 32'b000000000001_00000_000_00010_0010011; //addi 2 0 1
    //inst[1] = 32'b0000000_00010_00010_000_00001_0110011; //add 1 0 2
    //inst[2] = 32'b0000000_00001_00000_010_00100_0100011; //sw valor 1 --> 4
    //inst[3] = 32'b000000000100_00000_010_00100_0000011; //lw valor 4 --> 4
    //inst[2] = 32'b00000000000000000010_11111_0010111; //auipc pc + 2
    //inst[2] = 32'b10000000000000000000_11111_0110111; //auipc 1 no mais significativo
    //inst[2] = 32'b0000000_00001_00010_100_10100_1100011; //blt pc+10 1 2
    //inst[3] = 32'b0000000_00010_00010_100_10100_1100011; //blt pc+10 1 1
    //inst[2] = 32'b0100000_00010_00001_100_00011_0110011; //sra 3 2 1
    //inst[3] = 32'b0100000_00010_00001_110_00011_0110011; // or 3 2 1
    //inst[4] = 32'b0100000_00010_00001_001_00011_0110011; // sll 3 2 1
    //inst[3] = 32'b0100000_00010_00001_101_00011_0110011; // srl 3 2 1
    //inst[7] = 32'b0100000_00010_00001_011_00011_0110011; //sub 3 2 1
    //inst[3] = 32'b000000001010_00001_000_11111_1100111; //jalr 2 + 10
    //inst[4] = 32'b00000000000000000001_11111_1101111; //jal 1 11111
    //inst[4] = 32'b00000000000000000001_00111_0010111; //aui pc +1, 7
    //inst[5] = 32'b11000000000000000001_11111_0110111; //lui 11...00001 11




        // ... (inicialize o restante das posições com 0)

        // Instruções já fornecidas

        // ... (inicialize o restante das instruções com 0)
    end

    assign out_inst = {inst[pc], inst[pc+1], inst[pc+2], inst[pc+3]};     // Saída de instrução

endmodule
