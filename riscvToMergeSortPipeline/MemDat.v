module MemDat(
    input [31:0] value,       // valor de entrada (8 bits)
    input esc_mem,           // sinal de controle para escrita em memória
    input read_mem,
    input [31:0] dst_mem,     // endereço de destino para escrita
    output [31:0] out_dat,  // saída de dados (8 bits)
    input clock
);
//colocar readMem
    // Memória de dados (256 posições, 8 bits cada)
    reg [7:0] dat [0:255];

    // Inicialização das memórias
    initial begin
        dat[0] = 8'b00000000;
        dat[1] = 8'b00000000;
        // ... (inicialize o restante das posições com 0)

        // Instruções já fornecidas

        // ... (inicialize o restante das instruções com 0)
    end

    // Escreve na memória de dados quando esc_mem é 1
    always @(posedge clock) begin
        dat[dst_mem] <= value[31:24];
        dat[dst_mem + 1] <= value[23:16];
        dat[dst_mem + 2] <= value[15:8];
        dat[dst_mem + 3] <= value[7:0];
    end

    // Atribuições para as saídas
    assign out_dat = {dat[dst_mem], dat[dst_mem + 1], dat[dst_mem + 2], dat[dst_mem + 3]};  // Saída de dados

endmodule
