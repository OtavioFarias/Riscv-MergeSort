module Top(

    input reset,
    input clock

);

    reg [31:0]pc;
    wire [31:0]inst;
    wire EscReg, EscMem, ulaImm, lui, jump, Branch, auiPc, jalr, lw;
    wire jumpTaked;
    wire [31:0] muxAluB, muxAluA, muxMemToReg, imm, rs1, rs2, outAlu, outMem, valueMem                                    ;
    wire [31:0]newPC;
    wire [2:0]aluControl;


Alu ALU(

    .inputA(muxAluA),
    .inputB(muxAluB),
    .out(outAlu),
    .control(aluControl)

    );

ControlUnit UC(

    .inst(inst),
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

    .inst(inst),
    .imm(imm)

    );

MemInst MemInst(

    .pc(pc),
    .out_inst(inst),
    .clock(clock)

    );
MemDat MemDat(

    .value(rs2),
    .esc_mem(EscMem),
    .dst_mem(outAlu),
    .read_mem(lw),
    .out_dat(outMem),
    .clock(clock)

    );

RegisterBank Regs(

    .rs1(inst[19:15]),
    .rs2(inst[24:20]),
    .rd(inst[11:7]),
    .regWrite(EscReg),
    .reset(reset),
    .clock(clock),
    .writeData(muxMemToReg),
    .outReg1(rs1),
    .outReg2(rs2)

    );

    assign muxAluB = (ulaImm == 0) ? imm : rs2;
    assign muxAluA = (auiPc == 0) ? rs1 : pc;
    assign muxMemToReg = (lw == 0) ? (lui == 0) ? (jumpTaked == 0) ? outAlu : (pc + 4) : imm : outMem;

    assign jumpTaked = (Branch & outAlu != 32'b0) || (jump | jalr);

    assign newPC = (jumpTaked == 0) ? (pc + 4) : (jump == 1) ? imm : (jalr == 0) ? imm + pc : {outAlu[31:1], 1'b0};

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
