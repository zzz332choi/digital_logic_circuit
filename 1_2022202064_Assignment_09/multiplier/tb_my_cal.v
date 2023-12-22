`timescale 1ns/100ps

module tb_my_cal;
	
	reg [63:0]a; 			// 64bits reg
	reg [7:0] cnt; 		// 8bits reg
	reg [127:0] b;			// 128bits reg
	reg [2:0] x;			// 2bits reg
	
	wire [127:0] result;	// 128bits wire
	
	// parameters
	parameter SHIFT0 = 3'b000;
	parameter PL_ONE0 = 3'b010;
	parameter MI_TWO = 3'b100;
	parameter MI_ONE0 = 3'b110;
	parameter PL_ONE1 = 3'b001;
	parameter PL_TWO = 3'b011;
	parameter MI_ONE1 = 3'b101;
	parameter SHIFT1 = 3'b111;
	
	parameter T = 5;
	
	always #T cnt = cnt + 1;
	
	my_cal test_my_cal(a, b, x, result, cnt);
	
	initial begin
		#0; x = SHIFT0; a = 64'h7; b = 128'h00fff; cnt = 8'b1;
		#T; x = PL_ONE0;
		#T; x = MI_TWO;
		#T; x = MI_ONE0;
		#T; x = PL_ONE1;
		#T; x = PL_TWO;
		#T; x = MI_ONE1;
		#T; x = SHIFT1;
		#T; $stop;
	end

endmodule
