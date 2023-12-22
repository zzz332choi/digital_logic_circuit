module tb_ns_logic;

	reg 			load, inc;	// regs
	reg [2:0] 	state;		// 3bits reg
	wire [2:0]	next_state;	// 3bits wire

	// Instance ns_logic
	ns_logic test_ns_logic(.load(load), .inc(inc), .state(state), .next_state(next_state));

	initial begin
		#0; load = 0; inc = 0; state = 3'b000; // next_state = 3'b100
		#5; load = 1;									// next_state = 3'b001
		#5; load = 0; inc = 1; state = 3'b010; // next_state = 3'b011
		#5; load = 0; inc = 1; state = 3'b011; // next_state = 3'b010
		#5; load = 0; inc = 1; state = 3'b010; // next_state = 3'b011
		#5; load = 1; inc = 0; state = 3'b100; // next_state = 3'b001
		#5; load = 0; inc = 0; state = 3'b001; // next_state = 3'b100
		#5; load = 0; inc = 0; state = 3'b100; // next_state = 3'b101
		#5; load = 0; inc = 0; state = 3'b101; // next_state = 3'b100
		#5;
		
	end
	
endmodule
	