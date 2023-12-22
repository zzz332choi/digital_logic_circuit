`timescale 1ns/100ps

module tb_ram;

	// reg & wire
	reg 				clk;
	reg 				cen, wen;
	reg 	[7:0]		addr;
	reg 	[63:0]	din;
	wire	[63:0]	dout;
	
	// instance ram module
	ram test_ram(clk, cen, wen, addr, din, dout);

	parameter T = 5;
	
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; clk = 0; cen = 0; wen = 0; addr = 8'd10; din = 64'h12aabbccccccccaababa34;
		#T; wen = 1; 
		#T; addr = 8'd153; din = 64'h430000000000bbb0b0b0baaababa21;
		#T; addr = 8'd13; din = 64'h2cccccacacac345;
		#T; wen = 0;
		#T; addr = 8'd160;
		#T; addr = 8'd153;
		#T; cen = 1; wen = 1; addr = 8'd10; din = 64'hfbbbababacccfff;
		#T; addr = 8'd11; din = 64'h1234;
		#T; addr = 8'd8; din = 64'h999ffffffaabab9;
		#T; wen = 0;
		#T; addr = 8'd8;
		#T; addr = 8'd118;
		#T; addr = 8'd2;
		#T; addr = 8'd160;
		#T; addr = 8'h0b;
		#(3*T);
		#T; addr = 8'h0a;
		#(3*T); $stop;
	end
	
endmodule
