module MemDat(
    input [31:0] value,
    input read, write,
    input [31:0] address,

    output [31:0] outData,
    input clock,
    output miss,
    input reset,
    input [31:0] outRAM,
    output [31:0] addressToRAM,
    output reg writeRAM, readRAM,
    input ramReady, dataUsingRAM,
    output reg [31:0] valueRAM

);

//integer i;

reg [1:0] stage;

localparam IDLE = 2'b00,
       WRITE_BACK = 2'b01,
       UPDATE_CACHE = 2'b11;


parameter CacheTam = 128;

wire hit;

wire ready;

assign ready = hit && stage == IDLE;

assign miss = !ready;

reg [7:0] data[0:CacheTam-1];
reg valid[0:CacheTam-1];
reg dirty[0:CacheTam-1];
reg [24:0] tagArray[0:CacheTam-1];

assign addressToRAM = (writeRAM) ? {tagArray[index], index} : address;

wire [6:0] index = address[6:0];
wire [24:0] tag = address[31:7];

//wire dirtyA = dirty[index];
//wire [24:0] tagA = tagArray[index];
//wire validA = valid[index];

assign hit = (valid[index] && tagArray[index] == tag);

assign outData = {data[index], data[index + 1], data[index + 2], data[index + 3]};

always @(posedge clock, posedge reset)begin

	if(reset) begin

		for (integer i = 0; i < CacheTam; i = i + 1) begin
				data[i]     <= 8'b0;
				valid[i]    <= 1'b0;
				tagArray[i] <= 1'b0;
				dirty[i]    <= 1'b0;
		end

		writeRAM <= 1'b0;
		stage <= IDLE;

	end

	else begin

		case(stage)

			IDLE: begin

				readRAM <= 0;

			    if (read) begin
			        if (hit) begin

			            //outData <= data[index];
			            stage <= IDLE;

			        end else begin


			            if (dirty[index]) begin

							dirty[index] <= 1'b0;
							writeRAM <= 1'b1;
			                stage <= WRITE_BACK;
			                valueRAM <= {data[index], data[index + 1], data[index + 2], data[index + 3]};

			            end else begin

							readRAM <= 1'b1;
			                stage <= UPDATE_CACHE;

			            end
			        end
			    end else if (write) begin
			        if (hit) begin

			            data[index] <= value[31:24];
			            data[index + 1] <= value[23:16];
			            data[index + 2] <= value[15:8];
			            data[index + 3] <= value[7:0];
			        	dirty[index]    <= 1'b1;
			            stage <= IDLE;

			        end else begin

			            if (dirty[index]) begin

			            	dirty[index] <= 1'b0;
			                stage <= WRITE_BACK;
			                writeRAM <= 1'b1;
			                valueRAM <= {data[index], data[index + 1], data[index + 2], data[index + 3]};

			            end else begin

							readRAM <= 1'b1;
			                stage <= UPDATE_CACHE;

			            end
			        end
			    end
			end

			WRITE_BACK: begin

				if(dataUsingRAM) begin

				    stage <= UPDATE_CACHE;
			    	writeRAM <= 0;

			    end
			    else begin

			     stage <= WRITE_BACK;

			    end

			end

			UPDATE_CACHE: begin

				if(ramReady && dataUsingRAM) begin

					valid[index] <= 1;
					tagArray[index] <= tag;
					data[index] <= outRAM[31:24];
					data[index + 1] <= outRAM[23:16];
					data[index + 2] <= outRAM[15:8];
					data[index + 3] <= outRAM[7:0];
					//outData <= outRAM;
					stage <= IDLE;
					readRAM <= 1'b0;

				end
				else begin

		    		stage <= UPDATE_CACHE;

		 	    end


	    	end
		endcase
	end
end

wire [31:0] dado0 = {data[0], data[1], data[2], data[3]};
wire [31:0] dado4 = {data[4], data[5], data[6], data[7]};
wire [31:0] dado8 = {data[8], data[9], data[10], data[11]};
wire [31:0] dado12 = {data[12], data[13], data[14], data[15]};
wire [31:0] dado16 = {data[16], data[17], data[18], data[19]};
wire [31:0] dado20 = {data[20], data[21], data[22], data[23]};
wire [31:0] dado24 = {data[24], data[25], data[26], data[27]};
wire [31:0] dado28 = {data[28], data[29], data[30], data[31]};
wire [31:0] dado32 = {data[32], data[33], data[34], data[35]};
wire [31:0] dado36 = {data[36], data[37], data[38], data[39]};
wire [31:0] dado40 = {data[40], data[41], data[42], data[43]};
wire [31:0] dado44 = {data[44], data[45], data[46], data[47]};
wire [31:0] dado48 = {data[48], data[49], data[50], data[51]};
wire [31:0] dado52 = {data[52], data[53], data[54], data[55]};
wire [31:0] dado56 = {data[56], data[57], data[58], data[59]};
wire [31:0] dado60 = {data[60], data[61], data[62], data[63]};
wire [31:0] dado64 = {data[64], data[65], data[66], data[67]};
wire [31:0] dado68 = {data[68], data[69], data[70], data[71]};
wire [31:0] dado72 = {data[72], data[73], data[74], data[75]};
wire [31:0] dado76 = {data[76], data[77], data[78], data[79]};
wire [31:0] dado80 = {data[80], data[81], data[82], data[83]};
wire [31:0] dado84 = {data[84], data[85], data[86], data[87]};
wire [31:0] dado88 = {data[88], data[89], data[90], data[91]};
wire [31:0] dado92 = {data[92], data[93], data[94], data[95]};
wire [31:0] dado96 = {data[96], data[97], data[98], data[99]};
wire [31:0] dado100 = {data[100], data[101], data[102], data[103]};
wire [31:0] dado104 = {data[104], data[105], data[106], data[107]};
wire [31:0] dado108 = {data[108], data[109], data[110], data[111]};
wire [31:0] dado112 = {data[112], data[113], data[114], data[115]};
wire [31:0] dado116 = {data[116], data[117], data[118], data[119]};
wire [31:0] dado120 = {data[120], data[121], data[122], data[123]};
wire [31:0] dado124 = {data[124], data[125], data[126], data[127]};

endmodule
