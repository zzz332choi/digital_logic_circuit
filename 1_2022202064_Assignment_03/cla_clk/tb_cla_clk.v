`timescale 1ns/100ps

module tb_cla_clk;	
	
	reg clk; // Declare a 1-bit register 'clk'
	reg [31:0] a, b; // Declare 4-bit registers 'a' and 'b'
	reg ci; // Declare a 1-bit register 'ci'
	wire [31:0] s; // Declare an output signal 's'
	wire co; // Declare an output signal 'co'

	parameter T = 10;
	
	cla_clk tb(.s(s), .co(co), .a(a), .b(b), .ci(ci), .clk(clk)); // Instantiate module rca4 and connect the input and output signals
	
	always # (T/2) clk = !clk;
	
	initial begin
	
		a = 4'b0000; b = 4'b0000; ci = 0; clk = 1;// 0 + 0
		
		#(T-2) a = 32'h0000_0000; b = 32'h0000_0000; ci = 0;// expected value : 32'h0000_0000
		#T a = 32'h0000_0000; b = 32'hffff_0000; // expected value : 32'hffff_0000
		#T a = 32'hffff_0000; b = 32'h0000_0000; // expected value : 32'hffff_0000 
		#T a = 32'h0000_ffff; b = 32'hffff_0000; // expected value : 32'hffff_ffff
		#T a = 32'h1234_ffff; b = 32'h0001_0001; // expected value : 32'h1236_0000
		
		#T a = 32'h0000_0000; b = 32'hffff_ffff; // expected value : 32'hffff_ffff
		#T a = 32'hffff_ffff; b = 32'h0000_0001; // expected value : 32'h0000_0000 // overflow
		#T a = 32'h0000_0001; b = 32'hffff_ffff; // expected value : 32'h0000_0000 // overflow
		
		#T a = 32'h1234_1234; b = 32'h4321_4321; // expected value : 32'h5555_5555
		#T a = 32'h9876_9876; b = 32'h1234_1234; // expected value : 32'haaaa_aaaa
		
		#T a = 32'habca_bbbb; b = 32'h1234_3321; // expected value : 32'hbdfe_eedc
		
		#T a = 32'hffff_ffff; b = 32'hffff_ffff; // expected value : 32'hffff_fffe // overflow
		
		#(2*T) $stop;
		
	end
	
endmodule
