module Memories(

	input clock,
	input reset,

    input [31:0] addressInst,
	input jumpTaked,

    input [31:0] value,
    input write,
    input [31:0] addressData,
    input readData,

    output [31:0] outInst,
    output [31:0] outData,
	output outStall

);

wire [31:0] addressDataToRAM, outRAM, valueRAM;
wire writeRAM, readRAMdata, readRAMinst, ramInstReady, ramDataReady, dataUsingRAM;

wire missInst, missData;
assign outStall =  (missInst ||  (missData && (readData || write)));

MemInst MemInst(

    .address(addressInst),
    .outData(outInst),
    .clock(clock),
    .stall(jumpTaked),
	.reset(reset),
	.miss(missInst),
	.outRAM(outRAM),
	.ramReady(ramInstReady),
  	.readRAM(readRAMinst)
);

MemDat MemDat(

    .value(value),
    .write(write),
    .address(addressData),
    .read(readData),
    .outData(outData),
    .clock(clock),
	.reset(reset),
	.miss(missData),
	.valueRAM(valueRAM),
	.outRAM(outRAM),
	.addressToRAM(addressDataToRAM),
	.writeRAM(writeRAM),
	.readRAM(readRAMdata),
    .ramReady(ramDataReady),
    .dataUsingRAM(!dataUsingRAM)

);

CacheToRAM cacheRam(

    .addressDat(addressDataToRAM),
    .write(writeRAM),
    .value(valueRAM),
    .readDat(readRAMdata),
    .addressInst(addressInst),
    .data(outRAM),
    .readInst(readRAMinst),
	.cacheInstReady(ramInstReady),
	.cacheDataReady(ramDataReady),
	.clock(clock),
	.chosenUser(dataUsingRAM),
	.reset(reset)

);

endmodule