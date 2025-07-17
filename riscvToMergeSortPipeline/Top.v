module Top(

    input reset,
    input clock

);

    reg [31:0]pc;
    wire [31:0]inst;
    wire EscReg, EscMem, ulaImm, lui, jump, Branch, auiPc, jalr, lw;
    wire jumpTaked;
    wire [31:0] muxAluB, muxAluA, muxMemToReg, imm, rs1, rs2, outAlu, outMem, valueMem, muxAlu_jumpAdress, pcAdd4                                    ;
    wire [31:0]newPC;
    wire [2:0]aluControl;

    wire [31:0] pcID, pcAdd4ID, instID;

    wire [31:0] rs1EX, rs2EX, immEX, pcEX, pcAdd4EX;
    wire [4:0] rdEX;
    wire EscRegEX, EscMemEX, ulaImmEX, jumpEX, BranchEX, luiEX, auiPcEX, jalrEX, lwEX;
    wire [2:0] aluControlEX;

    wire [31:0] rs2MEM, immPcMEM, pcAdd4MEM, outAluMEM, immMEM;
    wire [4:0] rdMEM;
    wire EscRegMEM, EscMemMEM, jumpMEM, BranchMEM, luiMEM, jalrMEM, lwMEM;

    wire [31:0] outAlu_jumpAdressWB, outMemWB, immWB;
    wire [4:0] rdWB;
    wire EscRegWB, lwWB, luiWB;

IF_ID if_id(

    .clk(clock),
    .reset(reset),
    .pc(pc),
    .pcAdd4(pcAdd4),
    .inst(inst),
    .pcOut(pcID),
    .pcAdd4Out(pcAdd4ID),
    .instOut(instID)

);

ID_EX id_ex(

    .clk(clock),
    .reset(reset),
    .rs1(rs1),
    .rs2(rs2),
    .imm(imm),
    .rd(instID[11:7]),
    .pc(pcID),
    .pcAdd4(pcAdd4ID),
    .EscReg(EscReg),
    .EscMem(EscMem),
    .ulaImm(ulaImm),
    .jump(jump),
    .Branch(Branch),
    .lui(lui),
    .auiPc(auiPc),
    .jalr(jalr),
    .lw(lw),
    .aluControl(aluControl),
    .rs1Out(rs1EX),
    .rs2Out(rs2EX),
    .immOut(immEX),
    .rdOut(rdEX),
    .pcOut(pcEX),
    .pcAdd4Out(pcAdd4EX),
    .EscRegOut(EscRegEX),
    .EscMemOut(EscMemEX),
    .ulaImmOut(ulaImmEX),
    .jumpOut(jumpEX),
    .BranchOut(BranchEX),
    .luiOut(luiEX),
    .auiPcOut(auiPcEX),
    .jalrOut(jalrEX),
    .lwOut(lwEX),
    .aluControlOut(aluControlEX)

);

EX_MEM ex_mem(

    .clk(clock),
    .reset(reset),
    .rs2(rs2EX),
    .immPc(immEX + pcEX),
    .rd(rdEX),
    .pcAdd4(pcAdd4EX),
    .outAlu(outAlu),
    .EscReg(EscRegEX),
    .EscMem(EscMemEX),
    .jump(jumpEX),
    .Branch(BranchEX),
    .lui(luiEX),
    .jalr(jalrEX),
    .lw(lwEX),
    .imm(immEX),
    .rs2Out(rs2MEM),
    .immPcOut(immPcMEM),
    .rdOut(rdMEM),
    .pcAdd4Out(pcAdd4MEM),
    .outAluOut(outAluMEM),
    .EscRegOut(EscRegMEM),
    .EscMemOut(EscMemMEM),
    .jumpOut(jumpMEM),
    .BranchOut(BranchMEM),
    .luiOut(luiMEM),
    .jalrOut(jalrMEM),
    .lwOut(lwMEM),
    .immOut(immMEM)

);

MEM_WB mem_wb(

    .clk(clock),
    .reset(reset),
    .outAlu_jumpAdress(muxAlu_jumpAdress),
    .outMem(outMem),
    .rd(rdMEM),
    .EscReg(EscRegMEM),
    .lw(lwMEM),
    .lui(luiMEM),
    .imm(immMEM),
    .outAlu_jumpAdressOut(outAlu_jumpAdressWB),
    .outMemOut(outMemWB),
    .rdOut(rdWB),
    .EscRegOut(EscRegWB),
    .lwOut(lwWB),
    .immOut(immWB),
    .luiOut(luiWB)

);

Alu ALU(

    .inputA(muxAluA),
    .inputB(muxAluB),
    .out(outAlu),
    .control(aluControlEX)

    );

ControlUnit UC(

    .inst(instID),
    .EscReg(EscReg),
    .EscMem(EscMem),
    .lui(lui),
    .jump(jump),
    .Branch(Branch),
    .aluControl(aluControl),
    .auiPc(auiPc),
    .jalr(jalr),
    .lw(lw),
    .ulaImm(ulaImm)
    );

ImmDecode DI(

    .inst(instID),
    .imm(imm)

    );

MemInst MemInst(

    .pc(pc),
    .out_inst(inst),
    .clock(clock)

    );
MemDat MemDat(

    .value(rs2MEM),
    .esc_mem(EscMemMEM),
    .dst_mem(outAluMEM),
    .read_mem(lwMEM),
    .out_dat(outMem),
    .clock(clock)

    );

RegisterBank Regs(

    .rs1(instID[19:15]),
    .rs2(instID[24:20]),
    .rd(rdWB),
    .regWrite(EscRegWB),
    .reset(reset),
    .clock(clock),
    .writeData(muxMemToReg),
    .outReg1(rs1),
    .outReg2(rs2)

    );

    assign muxAlu_jumpAdress = ((jumpMEM | jalrMEM) == 0) ? outAluMEM : pcAdd4MEM;
    assign muxAluB = (ulaImmEX == 0) ? immEX : rs2EX;
    assign muxAluA = (auiPcEX == 0) ? rs1EX : pcEX;

    assign muxMemToReg = (lwWB == 0) ? (luiWB == 0) ? outAlu_jumpAdressWB : immWB : outMemWB;

    assign jumpTaked = (BranchMEM & outAluMEM != 32'b0) || (jumpMEM | jalrMEM);

    assign newPC = (jumpTaked == 0) ? (pcAdd4) : (jalrMEM == 0) ? immPcMEM : {outAluMEM[31:1], 1'b0};

    assign pcAdd4 = pc + 4;

    always @(posedge clock, posedge reset)
    begin
        if(reset) begin

            pc <=32'b0;

        end

        else begin

            pc <= newPC;

        end
    end

endmodule
