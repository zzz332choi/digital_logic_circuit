`timescale 1ns/100ps

module tb_ns_logic;

	reg Ta, Tal, Tb, Tbl; // regs
	reg [2:0] q;				// 3bit reg
	wire [2:0] d;			// 3bit wire 

	// Instance next state  logic
	ns_logic test_ns_logic(.Ta(Ta), .Tb(Tb), .Tal(Tal), .Tbl(Tbl), .d(d), .q(q));
	
	initial begin
		#0; q = 3'b000; Ta = 0; Tal =0; Tb = 0; Tbl = 0; 
		#5; q = 3'b000; Ta = 1; Tal =0; Tb = 0; Tbl = 0;
		
		#5; q = 3'b001; Ta = 0; Tal =0; Tb = 0; Tbl = 0;
		
		#5; q = 3'b010; Ta = 0; Tal =0; Tb = 1; Tbl = 1;
		#5; q = 3'b010; Ta = 0; Tal =1; Tb = 1; Tbl = 1;	
	
		#5; q = 3'b011; Ta = 1; Tal =1; Tb = 1; Tbl = 1;
		
		#5; q = 3'b100; Ta = 0; Tal =0; Tb = 0; Tbl = 1;
		#5; q = 3'b100; Ta = 1; Tal =1; Tb = 1; Tbl = 0;			
	
		#5; q = 3'b101; Ta = 1; Tal =1; Tb = 1; Tbl = 1;	
		
		#5; q = 3'b110; Ta = 1; Tal =1; Tb = 1; Tbl = 0;
		#5; q = 3'b110; Ta = 1; Tal =1; Tb = 1; Tbl = 1;

		#5; q = 3'b111; Ta = 1; Tal =1; Tb = 1; Tbl = 1;

		#5;		
	
	end	

endmodule

