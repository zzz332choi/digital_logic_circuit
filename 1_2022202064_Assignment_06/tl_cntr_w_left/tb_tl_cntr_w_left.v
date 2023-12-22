`timescale 1ns/100ps

module tb_tl_cntr_w_left;

	reg 	clk, reset_n, Ta, Tb, Tal, Tbl;	// reg type variables
	wire	[1:0] La, Lb;							//	2bits wires
	
	parameter T = 10;
	always # (T/2) clk = ~clk;
	
	tl_cntr_w_left test(.clk(clk), .reset_n(reset_n), .Ta(Ta), .Tb(Tb), .Tal(Tal), .Tbl(Tbl), .La(La), .Lb(Lb));
	
	initial begin 
			clk = 0; reset_n = 1;
			#1;	reset_n = 0;
			#1;	reset_n = 1;
			#0;	Ta = 1; Tb = 0; Tal = 0; Tbl = 0;	//S0
			#T;	Ta = 0; Tb = 0; Tal = 0; Tbl = 0;	//S1
			#T;	Ta = 0; Tb = 0; Tal = 0; Tbl = 0;	//S2
			#T;	Ta = 0; Tb = 0; Tal = 1; Tbl = 0;	//S2
			#T;	Ta = 0; Tb = 0; Tal = 0; Tbl = 0;	//S3
			#T;	Ta = 0; Tb = 1; Tal = 0; Tbl = 0;	//S4
			#T;	Ta = 1; Tb = 1; Tal = 1; Tbl = 1;	//S4
			#T;	Ta = 0; Tb = 0; Tal = 0; Tbl = 0;	//S5
			#T;	Ta = 1; Tb = 1; Tal = 1; Tbl = 1;	//S6
			#T;	Ta = 0; Tb = 0; Tal = 1; Tbl = 1;	//S6
			#T;	Ta = 0; Tb = 0; Tal = 1; Tbl = 0;	//S7
			#T;	Ta = 0; Tb = 0; Tal = 0; Tbl = 0;	//S0
			#T;	$stop;
			
	end
	
endmodule
