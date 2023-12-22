`timescale 1ns/100ps

module tb_cla4;	
	
	reg [3:0] a, b; // Declare 4-bit registers 'a' and 'b'
	reg ci; // Declare a 1-bit register 'ci'
	wire [3:0] s; // Declare an output signal 's'
	wire co; // Declare an output signal 'co'

	cla4 tb(.s(s), .co(co), .a(a), .b(b), .ci(ci)); // Instantiate module cla4 and connect the input and output signals

	
	initial
	begin
		#0 a = 4'b0000; b = 4'b0000; ci = 0;// 0 + 0
		
		#5	a = 4'b0100; b = 4'b0000; // 4 + 0
		#5	a = 4'b0000; b = 4'b1000; // 0 + 8
		
		#5	a = 4'b0110; b = 4'b0001; // 6 + 1
		#5	a = 4'b0010; b = 4'b0101; // 2 + 5
		
		#5	a = 4'b1000; b = 4'b1000; // 8 + 8 // overflow
		#5	a = 4'b1001; b = 4'b0001; // 9 + 1
		
		#5	a = 4'b1110; b = 4'b0001; // 14 + 1
		#5	a = 4'b0001; b = 4'b1110; // 1 + 14
		
		#5	a = 4'b1111; b = 4'b0000; // 15 + 0
		#5	a = 4'b0000; b = 4'b1111; // 0 + 15
		
		#5	a = 4'b1111; b = 4'b1101; // 15 + 13 overflow
		#5	a = 4'b1011; b = 4'b0100; // 11 + 4
		
		#5;
		
	end
	
endmodule
