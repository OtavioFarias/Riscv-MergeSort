module extendMem(

    input [63:0]dataMemIn, dataMemOut,
    output [63:0]outMemIn, outMemOut,
    input signal, byteword, halfword, word

);

    assign outMemIn = (word == 0) ? (halfword == 0) ? (byteword == 0) ? dataMemIn :
                                                                        {{56{dataMemIn[63]}}, dataMemIn[6:0]} :
                                                                        {{48{dataMemIn[63]}}, dataMemIn[14:0]} :
                                                                        {{32{dataMemIn[63]}}, dataMemIn[30:0]};

    assign outMemOut = (word == 0) ? (halfword == 0) ? dataMemOut :
                       (signal == 0) ? {{48'b0}, dataMemOut[15:0]} : {{48{dataMemOut[15]}}, dataMemOut[15:0]} :
                       (signal == 0) ? {{32'b0}, dataMemOut[31:0]} : {{32{dataMemOut[31]}}, dataMemOut[31:0]};

endmodule
