`timescale 1ns/100ps

module tb_cla32;

	reg [31:0] a, b; // Declare 4-bit registers 'a' and 'b'
	reg ci; // Declare a 1-bit register 'ci'
	wire [31:0] s; // Declare an output signal 's'
	wire co; // Declare an output signal 'co'
	
	cla32 tb(.s(s), .co(co), .a(a), .b(b), .ci(ci)); // Instantiate module cla32 and connect the input and output signals
	
	initial 
	begin
		#0 a = 32'h0000_0000; b = 32'h0000_0000; ci = 0;// expected value : s = 32'h0000_0000
		#5 a = 32'h0000_0000; b = 32'hffff_0000; // expected value : s = 32'hffff_0000
		#5 a = 32'hffff_0000; b = 32'h0000_0000; // expected value : s = 32'hffff_0000 
		#5 a = 32'h0000_ffff; b = 32'hffff_0000; // expected value : s = 32'hffff_ffff
		#5 a = 32'h1234_ffff; b = 32'h0001_0001; // expected value : s = 32'h1236_0000
		
		#5 a = 32'h0000_0000; b = 32'hffff_ffff; // expected value : s = 32'hffff_ffff
		#5 a = 32'hffff_ffff; b = 32'h0000_0001; // expected value : s = 32'h0000_0000 // overflow
		#5 a = 32'h0000_0001; b = 32'hffff_ffff; // expected value : s = 32'h0000_0000 // overflow
		
		#5 a = 32'h1234_1234; b = 32'h4321_4321; // expected value : s = 32'h5555_5555
		#5 a = 32'h9876_9876; b = 32'h1234_1234; // expected value : s = 32'haaaa_aaaa
		
		#5 a = 32'habca_bbbb; b = 32'h1234_3321; // expected value : s = 32'hbdfe_eedc
		
		#5 a = 32'hffff_ffff; b = 32'hffff_ffff; // expected value : s = 32'hffff_fffe // overflow
		#5;
	end
	
	
endmodule
