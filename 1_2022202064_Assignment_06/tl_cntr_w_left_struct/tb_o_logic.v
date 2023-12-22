`timescale 1ns/100ps

module tb_o_logic;

	reg [2:0] q;			// 3bit reg
	wire [1:0] La, Lb; // 2bit wire
	
	//Instance output logic
	o_logic test_o_logic(.q(q), .La(La), .Lb(Lb));	
	
	initial begin
		#0; q = 3'b000;
		#5; q = 3'b001;
		#5; q = 3'b010;
		#5; q = 3'b011;
		#5; q = 3'b100;
		#5; q = 3'b101;
		#5; q = 3'b110;
		#5; q = 3'b111;
		#5;
	end

endmodule
