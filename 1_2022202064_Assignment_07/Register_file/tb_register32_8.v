`timescale 1ns/100ps

module tb_register32_8;
	
	reg 				clk, reset_n; 	// reg ports
	reg 	[7:0]		en;				// 8bits reg port
	reg 	[31:0]	d_in;				// 32bits reg port
	wire 	[31:0]	d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7; // 32bits wire ports
	
	register32_8 test_register32_8(.clk(clk), .reset_n(reset_n), .en(en), .d_in(d_in), 
											 .d_out0(d_out0), .d_out1(d_out1), .d_out2(d_out2), 
											 .d_out3(d_out3), .d_out4(d_out4), .d_out5(d_out5), .d_out6(d_out6), .d_out7(d_out7));
											 
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	initial begin
		reset_n = 0; clk = 0; d_in = 32'hffff_ffff;
		#1; reset_n = 1; en = 8'b0;
		#T; en = 8'b1;
		#T; en = 8'b10;
		#T; en = 8'b100;
		#T; en = 8'b1000;
		#T; en = 8'b10000;
		#T; en = 8'b100000;
		#T; en = 8'b1000000;
		#T; en = 8'b10000000;
		#T; $stop;		
	
	end
	


endmodule
