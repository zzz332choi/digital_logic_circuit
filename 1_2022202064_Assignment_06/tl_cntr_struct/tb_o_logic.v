`timescale 1ns/100ps

module tb_o_logic;

	reg [1:0] q;				// 2bit reg
	wire [1:0] La, Lb;		// 2bit wires
	
	// Instance output logic
	o_logic test_o_logic(.q(q), .La(La), .Lb(Lb));
	
	initial begin
		
		#0; q = 2'b00; // La = 2'b00, Lb = 2'b10
		#5; q = 2'b01;	// La = 2'b01, Lb = 2'b10
		#5; q = 2'b10;	// La = 2'b10, Lb = 2'b00
		#5; q = 2'b11;	// La = 2'b10, Lb = 2'b01
		#5;
		
	end

endmodule
