module ram(clk, cen, wen, addr, din, dout);
	
	// input & output
	input 					clk;
	input 					cen, wen;
	input 		[4:0]		addr;
	input 		[31:0]	din;
	output reg	[31:0]	dout;
	
	
	reg			[31:0]	mem	[0:31]; // 32 * 32
	integer i;
	
	// memory initialization
	initial begin
		for(i = 0; i<32; i=i+1) begin
			mem[i] <= 32'd0;
		end	
	end
	
	// read & write performance
	always @ (posedge clk) begin
		if(cen == 1'b1) begin
			if(wen == 1'b1) begin 	// write
				mem[addr] <= din;
				dout <= 32'b0;
			end
			else begin					// read
				dout <= mem[addr];
			end
		end
		else begin						// do nothing
			dout <= 32'b0;
		end
	end
	
endmodule
	