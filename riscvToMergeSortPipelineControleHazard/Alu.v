module Alu(

    input [31:0] inputA,
    input [31:0] inputB,
    output [31:0] out,
    input [2:0] control

);

    assign out = (control == 'b000) ? (inputA + inputB) ://add
                    (control == 'b001) ? (inputA <<< inputB) ://sll
                    (control == 'b100) ?  (($signed(inputA) < $signed(inputB)) ? 1'b1 : 1'b0) ://slt
                    (control == 'b110) ? (inputA | inputB) : // or
                    (control == 'b101) ? ($unsigned(inputA) >>> inputB) : //srl
                    (control == 'b010) ? ($signed(inputA) >>> inputB) : //sra
                    (control == 'b011) ? (inputA - inputB) : //sub
                                        32'b0;

                                        // 32'b0; //default

endmodule
