`timescale 1ns/100ps

module tb_shifter8;
	
	reg 			clk, reset_n; 	// regs	
	reg 	[1:0] shamt;			// 2bits reg
	reg	[2:0] op;				// 3bits reg
	reg 	[7:0] d_in;				// 8bits reg
	wire 	[7:0] d_out;			// 8bit wire
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	shifter8 test_shifter8(.clk(clk), .reset_n(reset_n), .op(op), .d_in(d_in), .d_out(d_out), .shamt(shamt)); // Instance 8bits shifter
	initial clk = 0;
	
	initial begin
	   #0; clk = 0; reset_n = 0; op = 3'b000; shamt = 2'b00; d_in = 8'b1100_0000; // reset
      #8; reset_n = 1;																				// d_out = 8'b0000_0000
      #T; op = 3'b000; d_in = 8'b1000_1111;	// d_out = 8'b0000_0000
      #T; op = 3'b001; 								// d_out = 8'b1000_1111   
      #T; op = 3'b100; shamt = 2'b11;			// d_out = 8'b1111_0001                
      #T; op = 3'b011; shamt = 2'b01;        // d_out = 8'b0111_1000
      #T; op = 3'b001; d_in = 8'b1100_1100;	// d_out = 8'b1100_1100 					  
      #T; op = 3'b010; shamt = 2'b10;			// d_out = 8'b0011_0000
      #T; op = 3'b001;								// d_out = 8'b1100_1100
      #T; op = 3'b010; shamt = 2'b11;			// d_out = 8'b0110_0000
      #T; op = 3'b100; shamt = 2'b11;			// d_out = 8'b0001_1000
		#T; op = 3'b001; d_in = 8'b1000_1111;  // d_out = 8'b1000_1111
		#T; op = 3'b011; shamt = 2'b10;			// d_out = 8'b0010_0011
      #(2*T); $stop;

	end
	
endmodule
	