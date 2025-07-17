module alu(

    input [63:0]InputA,
    input [63:0]InputB,
    output [63:0]OutAlu,
    input [2:0]aluControl,
    input alum
);

    wire [63:0] carry_vector = {64{alum}};


    assign OutAlu = (aluControl == 'b000) ? (InputA + (InputB ^ carry_vector) + alum) : //add/sub
                    (aluControl == 'b001) ? (InputA <<< InputB) : //shift left sll
                    (aluControl == 'b010) ? (($signed(InputA) < $signed(InputB)) ? 1'b1 : 1'b0) ://set less than slt
                    (aluControl == 'b011) ? ($unsigned((InputA) < $unsigned(InputB)) ? 1'b1 : 1'b0) ://set less than unsigned sltu
                    (aluControl == 'b100) ? (InputA ^ InputB) : //xor
                    (aluControl == 'b101) ? ((alum == 'b0) ? ($unsigned(InputA) >>> InputB) : ($signed(InputA) >>> InputB)) : //shift right srl/shift right arithmetic sra
                    (aluControl == 'b110) ? (InputA | InputB) : // or
                                         (InputA & InputB); // and

endmodule

