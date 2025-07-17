exec:
	iverilog -o build/tb_top.vvp top.v alu.v control_unit.v imm_decode.v memDat.v memInst.v RegisterBank.v tb_top.v extendAlu.v extendMem.v
	vvp build/tb_top.vvp
	gtkwave build/dump.vcd 
comp:
	iverilog -o build/tb_top.vvp top.v alu.v control_unit.v imm_decode.v memDat.v memInst.v RegisterBank.v tb_top.v extendAlu.v extendMem.v
	vvp build/tb_top.vvp
 
