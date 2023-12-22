`timescale 1ns/100ps

module tb_register32;
	reg [31:0] 	d; 	// 32bit reg type variable
	reg			clk;	// reg type variable
	wire [31:0]	q;		// 32bit wire
	
	parameter T = 10;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 5 seconds
	
	_register32 test_register32(.clk(clk), .d(d), .q(q)); // Instance 32bit register
	
	initial begin
		clk = 0; d = 32'h1234_5678;
		#(T+2); d = 32'h8765_4321;
		#T; d = 32'hffee_ddcc;
		#5; d = 32'hbbaa_9988;
		#5; d = 32'h7766_5544;
		#T; d = 32'h3322_1100;
		#8; d = 32'h1234_5678;
		#T; $stop;
	end

endmodule
