`timescale 1ns/100ps

module tb_register32_r_en;

	reg	clk, reset_n, en; // regs
	reg [31:0]	d;				// 32bits reg
	wire [31:0]	q;				// 32bits wire
		
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	
	register32_r_en test_register32_r_en(.clk(clk), .en(en), .d(d), .q(q), .reset_n(reset_n));
	
	initial begin
		clk = 0; en = 1; reset_n = 0;
		#1; reset_n = 1;
		#T; d = 32'hffff_ffff;
		#T; d = 32'h1234_1244;
		#T; en = 0; d = 32'h0000_0000;
		#T; d = 32'h0909_0123;
		#4; d = 32'h4433_3322; en = 1;
		#6; d = 32'h1111_1111;	
		#T; $stop;	
		
	end
		
endmodule
