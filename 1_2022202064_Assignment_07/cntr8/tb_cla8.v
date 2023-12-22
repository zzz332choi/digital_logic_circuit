`timescale 1ns/100ps

module tb_cla8;
	
	reg [7:0]	a, b;
	reg ci;
	wire [7:0] s;
	wire co;
		
	cla8 cla80(.a(a), .b(b), .ci(ci), .s(s), .co(co)); // Instance 8bits carry lookahead adder

	initial begin
		#0; a = 8'b0000_0000; b = 8'b0000_0000; ci = 0;	// s = 8'b0000_0000, co = 0
		#5; a = 8'b1111_0000; b = 8'b1111_1110; ci = 0;	// s = 8'b1110_1110, co = 1
		#5; a = 8'b0110_0000; b = 8'b1001_1111; ci = 0;	// s = 8'b1111_1111, co = 0
		#5; a = 8'b0000_1111; b = 8'b0110_0000; ci = 0;	// s = 8'b0110_1111, co = 0
		#5; a = 8'b1110_0000; b = 8'b0010_0000; ci = 0;	// s = 8'b0000_0000, co = 1
		#5; a = 8'b0110_0000; b = 8'b0100_0000; ci = 0;	// s = 8'b1010_0000, co = 0
		#5; a = 8'b0000_0110; b = 8'b0000_1100; ci = 0;	// s = 8'b0001_0010, co = 0
		#5;
		
	end

endmodule
