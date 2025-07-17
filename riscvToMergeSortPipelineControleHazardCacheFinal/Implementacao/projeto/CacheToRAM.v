module CacheToRAM(

	input clock, reset,
	input readInst, readDat, write,
	input [31:0] value,
	input [31:0] addressDat, addressInst,
	output cacheDataReady, cacheInstReady, chosenUser,
	output [31:0] data

);

wire [31:0] ramAddress;
assign ramAddress = (readInst) ? addressInst : addressDat;

wire readRAM;
assign readRAM = readDat || readInst;

wire ramStall;

//wire chosenUser = (readInst) ? 1 : 0;
//wire chosenUser;
assign chosenUser = readInst;

assign cacheDataReady = !ramStall && chosenUser == 0;
assign cacheInstReady = !ramStall && chosenUser == 1;

wire writeRAM;
assign writeRAM = write && !readInst;

RAM ram(

	.address(ramAddress),
	.value(value),
	.stallSignal(ramStall),
	.read(readRAM),
	.write(writeRAM),
	.data(data),
	.clock(clock),
	.reset(reset)

);

endmodule

