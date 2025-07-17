exec:
	iverilog -o build/tb_top.vvp Top.v Alu.v ControlUnit.v ImmDecode.v MemDat.v MemInst.v RegisterBank.v tb_top.v
	vvp build/tb_top.vvp
	gtkwave build/dump.vcd 
comp:
	iverilog -o build/tb_top.vvp Top.v Alu.v ControlUnit.v ImmDecode.v MemDat.v MemInst.v RegisterBank.v tb_top.v
	vvp build/tb_top.vvp
 
