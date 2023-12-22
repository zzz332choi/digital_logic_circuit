`timescale 1ns/100ps

module tb_ns_logic;

	reg Ta, Tb;		// reg
	reg [1:0] q;	// 2bit reg
	wire [1:0] d;	// 2bit wire

	// Instance next state logic
	ns_logic test_ns_logic (.Ta(Ta), .Tb(Tb), .q(q), .d(d));
	
	initial begin
		#0; Ta = 0; Tb = 0; q = 2'b00; 
		#5; Ta = 1; Tb = 1; 
		#5; q = 2'b10; Tb = 1;
		#5; Tb = 0;
		#5; Ta = 0;
		#5; q = 2'b11;
		#5; Ta = 1;
		
		
	end

endmodule
