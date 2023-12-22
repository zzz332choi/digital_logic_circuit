module register32_8 (clk, reset_n, en, d_in, d_out0,
							d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7);
	
	input 			clk, reset_n; 	// input ports
	input [7:0]		en;				// 8bits input port
	input [31:0]	d_in;				// 32bits input port
	output [31:0]	d_out0, d_out1, d_out2, d_out3, d_out4, d_out5, d_out6, d_out7; // 32bits output ports

   register32_r_en U0 (.clk(clk), .reset_n(reset_n), .en(en[0]), .d(d_in), .q(d_out0)); // Instance resettable enabled 32bits register
   register32_r_en U1 (.clk(clk), .reset_n(reset_n), .en(en[1]), .d(d_in), .q(d_out1)); // Instance resettable enabled 32bits register
   register32_r_en U2 (.clk(clk), .reset_n(reset_n), .en(en[2]), .d(d_in), .q(d_out2)); // Instance resettable enabled 32bits register
   register32_r_en U3 (.clk(clk), .reset_n(reset_n), .en(en[3]), .d(d_in), .q(d_out3)); // Instance resettable enabled 32bits register
   register32_r_en U4 (.clk(clk), .reset_n(reset_n), .en(en[4]), .d(d_in), .q(d_out4)); // Instance resettable enabled 32bits register
   register32_r_en U5 (.clk(clk), .reset_n(reset_n), .en(en[5]), .d(d_in), .q(d_out5)); // Instance resettable enabled 32bits register
   register32_r_en U6 (.clk(clk), .reset_n(reset_n), .en(en[6]), .d(d_in), .q(d_out6)); // Instance resettable enabled 32bits register
   register32_r_en U7 (.clk(clk), .reset_n(reset_n), .en(en[7]), .d(d_in), .q(d_out7)); // Instance resettable enabled 32bits register
	

endmodule
