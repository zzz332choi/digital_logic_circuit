`timescale 1ns/100ps

module tb_mux3_32bit;
	
	// regs & wire
	reg [31:0] a, b, c;
	reg [1:0]  s;
	wire [31:0] y;
	
	// instance mux3_32bit
	mux3_32bit test_mux3_32bit(a, b, c, s, y);
	
	initial begin
		#0; a = 32'h12341234; b = 32'hffffffff; c = 32'h00000000; s = 2'd0;
		#5; a = 32'h55555555; b = 32'h99995959; c = 32'h33333333;
		#5; a = 32'haaaaaaaa; b = 32'h11111111; c = 32'h23232323; s = 2'd1;
		#5; a = 32'hbbbb1111; b = 32'h77777333; c = 32'h99999aaa;
		#5; a = 32'h12341234; b = 32'hffffffff; c = 32'h00000000; s = 2'd2;
		#5; a = 32'h55555555; b = 32'h99995959; c = 32'h33333333;	
		#5;
	end
	
	
endmodule
