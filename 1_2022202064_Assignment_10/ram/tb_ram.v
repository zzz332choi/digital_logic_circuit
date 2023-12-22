`timescale 1ns/100ps

module tb_ram;

	// reg & wire
	reg 				clk;
	reg 				cen, wen;
	reg 	[4:0]		addr;
	reg 	[31:0]	din;
	wire	[31:0]	dout;
	
	// instance ram module
	ram test_ram(clk, cen, wen, addr, din, dout);

	parameter T = 5;
	
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; clk = 0; cen = 0; wen = 0; addr = 5'd10; din = 32'h1234;
		#T; wen = 1; 
		#T; addr = 5'd15; din = 32'h4321;
		#T; addr = 5'd13; din = 32'h2345;
		#T; wen = 0;
		#T; addr = 5'd10;
		#T; addr = 5'd15;
		#T; cen = 1; wen = 1; addr = 5'd10; din = 32'hffff;
		#T; addr = 5'd11; din = 32'h1234;
		#T; addr = 5'd8; din = 32'h9999;
		#T; wen = 0;
		#T; addr = 5'd8;
		#T; addr = 5'd11;
		#T; addr = 5'd2;
		#T; addr = 5'd10;
		#T; $stop;
	end
	
endmodule
