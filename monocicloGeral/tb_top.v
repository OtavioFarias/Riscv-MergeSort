`timescale 1ns/1ps

module tb_top;

  reg clk;
  reg reset;

  // Instância do módulo top
  top uut (
    .clock(clk),
    .reset(reset)
  );

  initial begin
    // Geração do VCD
    $dumpfile("build/dump.vcd");
    $dumpvars(0, tb_top);

    // Inicialização dos sinais
    clk = 0;
    reset = 1;

    // Aguarda 20ns com reset ativo
    #20;
    reset = 0;

    // Roda a simulação por mais 200ns
    #2000;

    // Finaliza a simulação
    $finish;
  end

  // Geração de clock (10ns de período: 5ns alto, 5ns baixo)
  always #5 clk = ~clk;

endmodule
