module MemDat(
    input [31:0] value,
    input read, write,
    input [31:0] address,
    output reg [31:0] outData,
    input clock,
    output reg hit,
    input reset
);

    // -------------------------------
    // Memória RAM simulada (principal)
    // -------------------------------
    reg [7:0] dat[0:4095];

    // Inicialização de alguns dados
    initial begin
        dat[0] = 8'd0; dat[1] = 8'd0; dat[2] = 8'd0; dat[3] = 8'd4;
        dat[4] = 8'd0; dat[5] = 8'd0; dat[6] = 8'd0; dat[7] = 8'd3;
        dat[8] = 8'd0; dat[9] = 8'd0; dat[10] = 8'd0; dat[11] = 8'd2;
        dat[12] = 8'd0; dat[13] = 8'd0; dat[14] = 8'd0; dat[15] = 8'd1;
    end

    // -------------------------------
    // Declaração do cache
    // -------------------------------
    reg [7:0] data[0:511];                // 512 bytes (128 blocos de 4 bytes)
    reg valid[0:127];                     // 1 bit por bloco
    reg dirty[0:127];
    reg [25:0] tagArray[0:127];           // tag por bloco

    // -------------------------------
    // Barramento com a RAM principal
    // -------------------------------
    wire [31:0] outRAM;
    reg writeRAM;
    reg [31:0] valueRAM;

    RAM1 ram (
        .address(address),
        .data(outRAM),
        .clock(clock),
        .write(writeRAM),
        .value(valueRAM)
    );

    // -------------------------------
    // Controle de endereçamento
    // -------------------------------
    wire [6:0] index = address[6:0];      // índice para o cache (128 entradas)
    wire [25:0] tag = address[31:6];      // tag

    // -------------------------------
    // Lógica principal
    // -------------------------------
    always @(posedge clock, posedge reset) begin
        writeRAM <= 1'b0; // padrão: não escrever na RAM

        if(reset) begin  hit <= 1'b1; end

        if (read) begin
            if (valid[index] && tagArray[index] == tag) begin
                // HIT
                outData <= {data[index], data[index+1], data[index+2], data[index+3]};
                hit <= 1'b1;
            end else begin
                // MISS
                if (dirty[index]) begin
                    valueRAM <= {data[index], data[index+1], data[index+2], data[index+3]};
                    writeRAM <= 1'b1;
                    dirty[index] <= 1'b0;
                end

                // Atualiza cache com novo dado vindo da RAM
                data[index]     <= outRAM[31:24];
                data[index+1]   <= outRAM[23:16];
                data[index+2]   <= outRAM[15:8];
                data[index+3]   <= outRAM[7:0];
                valid[index]    <= 1'b1;
                dirty[index]    <= 1'b0;
                tagArray[index] <= tag;

                outData <= outRAM;
                hit <= 1'b0;
            end
        end

        if (write) begin
            if (valid[index] && tagArray[index] == tag) begin
                // HIT
                data[index]     <= value[31:24];
                data[index+1]   <= value[23:16];
                data[index+2]   <= value[15:8];
                data[index+3]   <= value[7:0];
                dirty[index]    <= 1'b1;
                hit <= 1'b1;
            end else begin
                // MISS
                if (dirty[index]) begin
                    valueRAM <= {data[index], data[index+1], data[index+2], data[index+3]};
                    writeRAM <= 1'b1;
                    dirty[index] <= 1'b0;
                end

                // Carrega da RAM para cache e sobrescreve
                data[index]     <= outRAM[31:24];
                data[index+1]   <= outRAM[23:16];
                data[index+2]   <= outRAM[15:8];
                data[index+3]   <= outRAM[7:0];
                valid[index]    <= 1'b1;
                dirty[index]    <= 1'b1;
                tagArray[index] <= tag;

                // Escreve novo valor
                data[index]     <= value[31:24];
                data[index+1]   <= value[23:16];
                data[index+2]   <= value[15:8];
                data[index+3]   <= value[7:0];

                hit <= 1'b0;
            end
        end
    end

endmodule
