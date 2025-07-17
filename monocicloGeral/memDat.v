module memDat(
    input [63:0] value,       // valor de entrada (8 bits)
    input esc_mem,           // sinal de controle para escrita em memória
    input [63:0] dst_mem,     // endereço de destino para escrita
    output [63:0] out_dat,  // saída de dados (8 bits)
    input clock
);
//colocar readMem
    // Memória de dados (256 posições, 8 bits cada)
    reg [64:0] dat [0:255];

    // Inicialização das memórias
    initial begin
        dat[0] = 64'b00000000;
        dat[1] = 64'b00000000;
        // ... (inicialize o restante das posições com 0)

        // Instruções já fornecidas

        // ... (inicialize o restante das instruções com 0)
    end

    // Escreve na memória de dados quando esc_mem é 1
    always @(posedge clock) begin
        dat[dst_mem] <= value;
    end

    // Atribuições para as saídas
    assign out_dat = dat[dst_mem];  // Saída de dados

endmodule
