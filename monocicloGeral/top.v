module top(

    input reset,
    input clock

);

    reg [63:0]pc;
    wire [31:0]inst;
    wire EscReg, EscMem, ulaImm, ulaPc, jump, readMem, BranchTrue, BranchFalse,alum, byteMem, halfMem, wordMem, wordAlu, signalAlu, signalMem, escImm, auiPc, jalr, jumpTaked;
    wire [63:0] muxAluB, muxAluA, muxMemToReg, imm, rs1, rs2, rs1ex, rs2ex, outAluex, outAlu, outMem, valueMemex, outMemex;
    wire [63:0]newPC;
    wire [2:0]aluControl;

extendMem exMem(

    .dataMemIn(rs1),
    .dataMemOut(outMem),
    .outMemIn(valueMemex),
    .outMemOut(outMemex),
    .signal(signalMem),
    .halfword(halfMem),
    .word(wordMem),
    .byteword(byteMem)

);

extendAlu exAlu(

    .dataRs1(muxAluA),
    .dataRs2(muxAluB),
    .resultAlu(outAlu),
    .outRs1(rs1ex),
    .outRs2(rs2ex),
    .outResultAlu(outAluex),
    .signal(signalAlu),
    .word(wordAlu),
    .auiPc(auiPc)


);



alu ALU(

    .InputA(rs1ex),
    .InputB(rs2ex),
    .OutAlu(outAlu),
    .aluControl(aluControl),
    .alum(alum)

    );

control_unit UC(

    .inst(inst),
    .EscReg(EscReg),
    .EscMem(EscMem),
    .ulaImm(ulaImm),
    .jump(jump),
    .readMem(readMem),
    .BranchTrue(BranchTrue),
    .BranchFalse(BranchFalse),
    .aluControl(aluControl),
    .ulaPc(ulaPc),
    .alum(alum),
    .halfMem(halfMem),
    .wordMem(wordMem),
    .wordAlu(wordAlu),
    .signalAlu(signalAlu),
    .signalMem(signalMem),
    .byteMem(byteMem),
    .escImm(escImm),
    .auiPc(auiPc),
    .jalr(jalr)

    );

imm_decode DI(

    .inst(inst),
    .funct3(inst[14:12]),
    .imm(imm)

    );

memInst MemInst(

    .pc(pc),
    .out_inst(inst),
    .clock(clock)

    );
memDat MemDat(

    .value(valueMemex),
    .esc_mem(EscMem),
    .dst_mem(outAlu),
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

    assign muxAluB = (ulaImm == 0) ? rs2 : imm;
    assign muxAluA = (ulaPc == 0) ? rs1 : pc;
    assign muxMemToReg = (readMem == 0) ? (escImm == 0) ? outAluex : imm : outMemex;

    assign jumpTaked = (BranchFalse ^ ( BranchTrue & outAlu != 64'b0)) || (jump | jalr);

    assign newPC = (jumpTaked == 0) ? (pc + 1) : (jump == 0) ? imm : (jalr == 0) ? imm + pc : outAlu;

    always @(posedge clock, posedge reset)
    begin
        if(reset) begin

            pc <=64'b0;

        end

        else begin

            pc <= newPC;

        end
    end

endmodule
