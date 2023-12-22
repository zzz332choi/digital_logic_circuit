`timescale 1ns/100ps

module tb_cc_logic;
	
	reg	[2:0]	op;
	reg	[1:0]	shamt;
	reg	[7:0]	d_in, d_out;
	wire	[7:0]	d_next;
	
	cc_logic test_cc_logic(.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(d_next));
	
	initial begin
		#0; op = 3'b000; shamt = 2'b00; d_in = 8'b0000_0000; d_out = 8'b0110_0000;	// d_next = 8'b0000_0000
		#5; op = 3'b001; d_in = 8'b0111_0111;													// d_next = 8'b0111_0111
		#5; op = 3'b010; shamt = 2'b11;															// d_next = 8'b0000_0000
		#5; op = 3'b011; shamt = 2'b01;															// d_next = 8'b0011_0000
		#5; op = 3'b100; d_in = 8'b1100_1100; shamt = 2'b10;								// d_next = 8'b0001_1000
		#5; d_out = 8'b1100_1100; shamt = 2'b11;												// d_next = 8'b1111_1001
		#5; op = 3'b000;																				// d_next = 8'b1100_1100
		#5;
		
	end	
	
endmodule
