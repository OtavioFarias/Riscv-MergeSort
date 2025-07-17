module ID_EX(

    input clk, reset,
    input [31:0] rs1, rs2, imm, pc, pcAdd4,
    input [4:0] rd, rs1end, rs2end,
    input EscReg, EscMem, ulaImm, jump, blt, bge, lui, auiPc, jalr, lw,
    input [2:0] aluControl,
    output reg [31:0] rs1Out, rs2Out, immOut, pcOut, pcAdd4Out,
    output reg [4:0] rdOut, rs1endOut, rs2endOut,
    output reg EscRegOut, EscMemOut, ulaImmOut, jumpOut, bltOut, bgeOut, luiOut, auiPcOut, jalrOut, lwOut,
    output reg [2:0] aluControlOut,
    input flush
);

always @(posedge clk, posedge reset)

    begin
    if (reset)
        begin

        rs1Out <= 32'b0;
        rs2Out <= 32'b0;
        immOut <= 32'b0;
        rdOut <= 5'b0;
        pcOut <= 32'b0;
        pcAdd4Out <= 32'b0;
        EscRegOut <= 1'b1;
        EscMemOut <= 1'b0;
        ulaImmOut <= 1'b0;
        jumpOut <= 1'b0;
        bltOut <= 1'b0;
        bgeOut <= 1'b0;
        luiOut <= 1'b0;
        auiPcOut <= 1'b0;
        jalrOut <= 1'b0;
        lwOut <= 1'b0;
        aluControlOut <= 3'b0;
        rs1endOut <=  5'b0;
        rs2endOut <= 5'b0;

    end

    else begin

    	if (flush)
		    begin

		    rs1Out <= 32'b0;
		    rs2Out <= 32'b0;
		    immOut <= 32'b0;
		    rdOut <= 5'b0;
		    pcOut <= 32'b0;
		    pcAdd4Out <= 32'b0;
		    EscRegOut <= 1'b1;
		    EscMemOut <= 1'b0;
		    ulaImmOut <= 1'b0;
		    jumpOut <= 1'b0;
		    bltOut <= 1'b0;
		    bgeOut <= 1'b0;
		    luiOut <= 1'b0;
		    auiPcOut <= 1'b0;
		    jalrOut <= 1'b0;
		    lwOut <= 1'b0;
		    aluControlOut <= 3'b0;
		    rs1endOut <=  5'b0;
		    rs2endOut <= 5'b0;

        end
		else begin

		    rs1Out <= rs1;
		    rs2Out <= rs2;
		    immOut <= imm;
		    rdOut <= rd;
		    pcOut <= pc;
		    pcAdd4Out <= pcAdd4;
		    EscRegOut <= EscReg;
		    EscMemOut <= EscMem;
		    ulaImmOut <= ulaImm;
		    jumpOut <= jump;
		    bltOut <= blt;
		    bgeOut <= bge;
		    luiOut <= lui;
		    auiPcOut <= auiPc;
		    jalrOut <= jalr;
		    lwOut <= lw;
		    aluControlOut <= aluControl;
		    rs1endOut <= rs1end;
		    rs2endOut <= rs2end;

        end
    end
end
endmodule
