exec:
	iverilog -o projeto/build/tb_top.vvp projeto/Top.v projeto/Alu.v projeto/ControlUnit.v projeto/ImmDecode.v projeto/MemDat.v projeto/MemInst.v projeto/RegisterBank.v projeto/tb_top.v projeto/IF_ID.v projeto/ID_EX.v projeto/EX_MEM.v projeto/MEM_WB.v projeto/Forwarding.v  projeto/CacheToRAM.v projeto/Memories.v
	vvp projeto/build/tb_top.vvp
	gtkwave projeto/build/dump.vcd
comp:
	iverilog -o projeto/build/tb_top.vvp projeto/Top.v projeto/Alu.v projeto/ControlUnit.v projeto/ImmDecode.v projeto/MemDat.v projeto/MemInst.v projeto/RegisterBank.v projeto/tb_top.v projeto/IF_ID.v projeto/ID_EX.v projeto/EX_MEM.v projeto/MEM_WB.v projeto/Forwarding.v  projeto/CacheToRAM.v projeto/Memories.v
	vvp projeto/build/tb_top.vvp
 
