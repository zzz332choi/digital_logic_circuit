`timescale 1ns/100ps

module tb_mx4;

	reg tb_d0, tb_d1, tb_d2, tb_d3; 	// regs
	reg [1:0] tb_s;						// 2bits reg
	wire tb_y;								// wire
	
	mx4 test_mx4(.y(tb_y), .s(tb_s), .d0(tb_d0), .d1(tb_d1), .d2(tb_d2), .d3(tb_d3));
	
	initial begin 
		#0; tb_d0 = 1; tb_d1 = 0; tb_d2 = 0; tb_d3 = 0; tb_s = 2'b00; // expected value y = 1'b1
		#5; tb_d0 = 0; tb_d1 = 1; tb_d2 = 0; tb_d3 = 0; tb_s = 2'b01; // expected value y = 1'b1
		#5; tb_d0 = 0; tb_d1 = 0; tb_d2 = 1; tb_d3 = 0; tb_s = 2'b10; // expected value y = 1'b1
		#5; tb_d0 = 0; tb_d1 = 0; tb_d2 = 0; tb_d3 = 1; tb_s = 2'b11; // expected value y = 1'b1
		
		#5; tb_d0 = 0; tb_d1 = 0; tb_d2 = 1; tb_d3 = 1; tb_s = 2'b00; // expected value y = 1'b0
		#5; tb_d0 = 0; tb_d1 = 1; tb_d2 = 0; tb_d3 = 1; tb_s = 2'b01; // expected value y = 1'b1
		#5; tb_d0 = 1; tb_d1 = 0; tb_d2 = 1; tb_d3 = 0; tb_s = 2'b10; // expected value y = 1'b1
		#5; tb_d0 = 0; tb_d1 = 1; tb_d2 = 1; tb_d3 = 0; tb_s = 2'b11; // expected value y = 1'b0
		#5;
	
	end
	
endmodule
