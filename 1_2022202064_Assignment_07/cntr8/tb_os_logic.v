`timescale 1ns/100ps

module tb_os_logic;
	
	reg [2:0]	state; 	// 3bits reg
	reg [7:0]	d_in;		// 8bits reg
	wire [7:0]	d_out; 	// 8bits wire
	
	// Instance output circuit logic
	os_logic tb_os_logic(.state(state), .d_in(d_in), .d_out(d_out));
	
	initial begin
		#0; state = 3'b000;	// d_out = 8'h00
		#5; state = 3'b001; d_in = 8'haa; // d_out = 8'haa
		#5; state = 3'b010; // d_out = 8'hab
		#5; state = 3'b011; // d_out = 8'hac
		#5; state = 3'b100; // d_out = 8'hab
		#5; state = 3'b101; // d_out = 8'haa
		#5; 
	end
	
endmodule
