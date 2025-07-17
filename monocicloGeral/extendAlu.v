module extendAlu(

    input [63:0]dataRs1, dataRs2, resultAlu,
    input auiPc,
    output [63:0]outRs1, outRs2, outResultAlu,
    input signal, word

);

    assign outRs1 = (word == 0) ? dataRs1 :
                    (signal == 0) ? {32'b0, dataRs1[31:0]} :
                                    {{32{dataRs1[63]}}, dataRs1[31:0]};

    assign outRs2 = (word == 0) ? dataRs2 :
                    (signal == 0) ? {32'b0, dataRs2[31:0]} :
                                    {{32{dataRs2[63]}}, dataRs2[31:0]};

    assign outResultAlu = (auiPc == 0 ) ? (word == 0) ? resultAlu :
                          (signal == 0) ? {32'b0, resultAlu[31:0]} :
                          {{32{resultAlu[31]}}, resultAlu[31:0]} : {resultAlu[51:0], 12'b0};

endmodule
