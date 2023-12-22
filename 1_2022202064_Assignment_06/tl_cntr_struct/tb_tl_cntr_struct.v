`timescale 1ns/100ps

module tb_tl_cntr_struct;
	
	reg clk, reset_n, Ta, Tb;
	wire [1:0] La, Lb;
	
	parameter T = 10;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 5seconds
	
	tl_cntr_struct test_tl_cntr_struct(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tb(Tb), .La(La), .Lb(Lb));

	initial begin
		clk = 0; reset_n = 1; Ta = 0; Tb = 0; 	
		#(1); 	reset_n = 0; 						// S0 	// La == 00 Lb == 10
		#(5); 	reset_n = 1;
		#(T - 3); 	Ta = 1; Tb = 0; 				// S0		// La == 00 Lb == 10
		#T; 		Ta = 1; Tb = 1; 				  	// S0		// La == 00 Lb == 10
		#T; 		Ta = 0; Tb = 0;				  	// S1		// La == 01 Lb == 10 // T = 33
		#(T); 	reset_n = 0;					  	// S0		// La == 00 Lb == 10 // T = 43
		#(T/2); 	reset_n = 1; Ta = 0; Tb = 1; 	// S1		// La == 01 Lb == 10 // T = 48
		#T; 		Ta = 1; Tb = 1; 				  	// S2		// La == 10 Lb == 00
		#T;		Ta = 0; Tb = 1; 					// S2		// La == 10 Lb == 00
		#T; 		Ta = 1; Tb = 1;					// S2		// La == 10 Lb == 00
		#T;		Ta = 0; Tb = 0;					// S3		// La == 10 Lb == 01 // T = 88
		#T;		Ta = 0; Tb = 0;					// S0		// La == 00 Lb == 10
		
		//#T;		Ta = 0; Tb = 1;					// S1		// La == 01 Lb == 10
		//#T; 		Ta = 0; Tb = 0; 					// S2		// La == 10 Lb == 00
		//#(T/2);	reset_n = 0;						// S0		// La == 00 Lb == 10
		//#(T/2);	reset_n = 1; Ta = 0; Tb = 1;	// S1		// La == 01 Lb == 10
		//#T;		Ta = 0; Tb = 1;					// S2		// La == 10 Lb == 00
		//#T;		Ta = 1; Tb = 0;					// S3		// La == 10 Lb == 01
		//#T;		Ta = 1; Tb = 1;					// S0		// La == 00 Lb == 10
		
		#T; 		$stop;
	end
	

endmodule
	
