module MemInst(
    input [31:0] address,
    output [31:0] outData,
    input clock,
  	output miss,
  	input reset,
  	input stall,
  	input [31:0] outRAM,
  	input ramReady,
  	output reg readRAM
);

reg [63:0] MissInst;

always @(posedge clock, posedge reset) begin

	if(reset)begin MissInst <= 64'b0; end else begin
	if(stage == UPDATE_CACHE) begin MissInst <= MissInst + 1; end end

end

reg stage;

localparam IDLE = 1'b0,
       	   UPDATE_CACHE = 1'b1;


//integer i;
parameter CacheTam = 128;

wire hit;

wire ready;

assign ready = hit && stage == IDLE;

assign miss = !ready;

reg [7:0] data[0:CacheTam-1];
reg valid[0:CacheTam-1];
reg [24:0] tagArray[0:CacheTam-1];

wire [6:0] index = address[6:0];
wire [24:0] tag = address[31:7];

//wire [24:0] tagA = tagArray[index];
//wire validA = valid[index];

assign hit = (valid[index] && tagArray[index] == tag);

assign outData = (stall) ? 32'b0 : {data[index], data[index + 1], data[index + 2], data[index + 3]};

always @(posedge clock, posedge reset)begin

	if(reset) begin

		for (integer i = 0; i < CacheTam; i = i + 1) begin
				data[i]     <= 8'b0;
				valid[i]    <= 1'b0;
				tagArray[i] <= 1'b0;
		end

		stage <= IDLE;
		readRAM <= 1'b0;

	end

	else begin

		case(stage)

			IDLE: begin

		        if (hit) begin

		            //outData <= data[index];
		            stage <= IDLE;

		        end else begin

		                stage <= UPDATE_CACHE;
		                readRAM <= 1'b1;

		        end
			end


			UPDATE_CACHE: begin
			    if(ramReady) begin

		    		stage <= IDLE;
		    		readRAM <= 1'b0;
		    		valid[index] <= 1;
					tagArray[index] <= tag;
					data[index] <= outRAM[31:24];
					data[index + 1] <= outRAM[23:16];
					data[index + 2] <= outRAM[15:8];
					data[index + 3] <= outRAM[7:0];
					//outData <= outRAM;


			    end
			    else begin

			    		stage <= UPDATE_CACHE;

			    end

	    	end

		endcase
	end
end

endmodule
