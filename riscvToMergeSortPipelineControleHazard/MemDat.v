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
    reg [7:0] dat [0:2031];
wire [31:0] dado0 = {dat[0], dat[1], dat[2], dat[3]};
wire [31:0] dado4 = {dat[4], dat[5], dat[6], dat[7]};
wire [31:0] dado8 = {dat[8], dat[9], dat[10], dat[11]};
wire [31:0] dado12 = {dat[12], dat[13], dat[14], dat[15]};
wire [31:0] dado16 = {dat[16], dat[17], dat[18], dat[19]};
wire [31:0] dado20 = {dat[20], dat[21], dat[22], dat[23]};
wire [31:0] dado24 = {dat[24], dat[25], dat[26], dat[27]};
wire [31:0] dado28 = {dat[28], dat[29], dat[30], dat[31]};
wire [31:0] dado32 = {dat[32], dat[33], dat[34], dat[35]};
wire [31:0] dado36 = {dat[36], dat[37], dat[38], dat[39]};
wire [31:0] dado40 = {dat[40], dat[41], dat[42], dat[43]};
wire [31:0] dado44 = {dat[44], dat[45], dat[46], dat[47]};
wire [31:0] dado48 = {dat[48], dat[49], dat[50], dat[51]};
wire [31:0] dado52 = {dat[52], dat[53], dat[54], dat[55]};
wire [31:0] dado56 = {dat[56], dat[57], dat[58], dat[59]};
wire [31:0] dado60 = {dat[60], dat[61], dat[62], dat[63]};
wire [31:0] dado64 = {dat[64], dat[65], dat[66], dat[67]};
wire [31:0] dado68 = {dat[68], dat[69], dat[70], dat[71]};
wire [31:0] dado72 = {dat[72], dat[73], dat[74], dat[75]};
wire [31:0] dado76 = {dat[76], dat[77], dat[78], dat[79]};
wire [31:0] dado80 = {dat[80], dat[81], dat[82], dat[83]};
wire [31:0] dado84 = {dat[84], dat[85], dat[86], dat[87]};
wire [31:0] dado88 = {dat[88], dat[89], dat[90], dat[91]};
wire [31:0] dado92 = {dat[92], dat[93], dat[94], dat[95]};
wire [31:0] dado96 = {dat[96], dat[97], dat[98], dat[99]};
wire [31:0] dado100 = {dat[100], dat[101], dat[102], dat[103]};
wire [31:0] dado104 = {dat[104], dat[105], dat[106], dat[107]};
wire [31:0] dado108 = {dat[108], dat[109], dat[110], dat[111]};
wire [31:0] dado112 = {dat[112], dat[113], dat[114], dat[115]};
wire [31:0] dado116 = {dat[116], dat[117], dat[118], dat[119]};
wire [31:0] dado120 = {dat[120], dat[121], dat[122], dat[123]};
wire [31:0] dado124 = {dat[124], dat[125], dat[126], dat[127]};
wire [31:0] dado128 = {dat[128], dat[129], dat[130], dat[131]};
wire [31:0] dado132 = {dat[132], dat[133], dat[134], dat[135]};
wire [31:0] dado136 = {dat[136], dat[137], dat[138], dat[139]};
wire [31:0] dado140 = {dat[140], dat[141], dat[142], dat[143]};
wire [31:0] dado144 = {dat[144], dat[145], dat[146], dat[147]};
wire [31:0] dado148 = {dat[148], dat[149], dat[150], dat[151]};
wire [31:0] dado152 = {dat[152], dat[153], dat[154], dat[155]};
wire [31:0] dado156 = {dat[156], dat[157], dat[158], dat[159]};
wire [31:0] dado160 = {dat[160], dat[161], dat[162], dat[163]};
wire [31:0] dado164 = {dat[164], dat[165], dat[166], dat[167]};
wire [31:0] dado168 = {dat[168], dat[169], dat[170], dat[171]};
wire [31:0] dado172 = {dat[172], dat[173], dat[174], dat[175]};
wire [31:0] dado176 = {dat[176], dat[177], dat[178], dat[179]};
wire [31:0] dado180 = {dat[180], dat[181], dat[182], dat[183]};
wire [31:0] dado184 = {dat[184], dat[185], dat[186], dat[187]};
wire [31:0] dado188 = {dat[188], dat[189], dat[190], dat[191]};
wire [31:0] dado192 = {dat[192], dat[193], dat[194], dat[195]};
wire [31:0] dado196 = {dat[196], dat[197], dat[198], dat[199]};
wire [31:0] dado200 = {dat[200], dat[201], dat[202], dat[203]};
wire [31:0] dado204 = {dat[204], dat[205], dat[206], dat[207]};
wire [31:0] dado208 = {dat[208], dat[209], dat[210], dat[211]};
wire [31:0] dado212 = {dat[212], dat[213], dat[214], dat[215]};
wire [31:0] dado216 = {dat[216], dat[217], dat[218], dat[219]};
wire [31:0] dado220 = {dat[220], dat[221], dat[222], dat[223]};
wire [31:0] dado224 = {dat[224], dat[225], dat[226], dat[227]};
wire [31:0] dado228 = {dat[228], dat[229], dat[230], dat[231]};
wire [31:0] dado232 = {dat[232], dat[233], dat[234], dat[235]};
wire [31:0] dado236 = {dat[236], dat[237], dat[238], dat[239]};
wire [31:0] dado240 = {dat[240], dat[241], dat[242], dat[243]};
wire [31:0] dado244 = {dat[244], dat[245], dat[246], dat[247]};
wire [31:0] dado248 = {dat[248], dat[249], dat[250], dat[251]};
wire [31:0] dado252 = {dat[252], dat[253], dat[254], dat[255]};



    // Inicialização das memórias
    initial begin

        $readmemb("dados.txt", dat);

    end

    // Escreve na memória de dados quando esc_mem é 1
    always @(posedge clock) begin
            if(esc_mem) begin
                dat[dst_mem] <= value[31:24];
                dat[dst_mem + 1] <= value[23:16];
                dat[dst_mem + 2] <= value[15:8];
                dat[dst_mem + 3] <= value[7:0];
            end
    end




    // Atribuições para as saídas
    assign out_dat = {dat[dst_mem], dat[dst_mem + 1], dat[dst_mem + 2], dat[dst_mem + 3]};  // Saída de dados

endmodule
