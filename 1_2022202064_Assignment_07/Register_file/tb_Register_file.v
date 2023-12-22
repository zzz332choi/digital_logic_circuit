`timescale 1ns/100ps

module tb_Register_file;
	
	reg 			clk, reset_n, we; // regs
	reg [2:0] 	Addr, wAddr;		// 3bits reg
	reg [31:0]	wData;				// 32bits reg
	wire [31:0]	rData;				// 32bits wire
	
	
	Register_file test_Register_file(.clk(clk), .reset_n(reset_n), .we(we), .rAddr(Addr), .wAddr(wAddr), .wData(wData), .rData(rData)); // Instance register file
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; reset_n = 0; clk = 0; we = 0; wAddr = 3'b000; Addr = 3'b000; wData = 32'h0000_0000; 	// fData = 32'h0000_0000
		#8; reset_n = 1; wData = 32'h1001_0111; we = 1;															// fData = 32'h1001_0111
		#T; wAddr = 3'b001; wData = 32'hff00_ff00; 																// fData = 32'h1001_0111
		#T; wAddr = 3'b010;																								// fData = 32'h1001_0111
		#T; wAddr = 3'b011; wData = 32'h12ff_0012;																// fData = 32'h1001_0111
		#T; we = 0; 																										// fData = 32'h1001_0111
		#T; Addr = 3'b001; 																								// fData = 32'hff00_ff00
		#T; Addr = 3'b010;																								// fData = 32'hff00_ff00
		#T; Addr = 3'b011;																								// fData = 32'h12ff_0012
		#T; we = 1; wAddr = 3'b010; wData = 32'h1234_1234;														// fData = 32'h12ff_0012
		#T; we = 0; Addr = 3'b010;																						// fData = 32'h1234_1234
		#(2*T); $stop;
		
	end
	
endmodule
