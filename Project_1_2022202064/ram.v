module ram(clk, cen, wen, addr, din, dout);
	
	// input & output
	input 					clk;
	input 					cen, wen;
	input 		[7:0]		addr;
	input 		[63:0]	din;
	output reg	[63:0]	dout;
	
	
	reg			[63:0]	mem	[0:255]; // 256 data storage spaces
	integer i;
	
	// memory initialization
	initial begin
		for(i = 0; i<256; i=i+1) begin
			mem[i] <= 64'd0;
		end	
	end
	
	// read & write performance
	always @ (posedge clk) begin
		if(cen == 1'b1) begin
			if(wen == 1'b1) begin 	// write
				mem[addr] <= din;
				dout <= 64'b0;
			end
			else begin					// read
				dout <= mem[addr];
			end
		end
		else begin						// do nothing
			dout <= 64'b0;
		end
	end
	
endmodule
	