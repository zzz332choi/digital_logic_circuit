`timescale 1ns/100ps

module tb_bus;
	
	// regs & wires
	reg clk, reset_n, m0_req, m0_wr, m1_req, m1_wr;
	reg [7:0] m0_address, m1_address;
	reg [31:0] m0_dout, m1_dout, s0_dout, s1_dout;
	
	wire m0_grant, m1_grant, s0_sel, s1_sel, s_wr;
	wire [7:0] s_address;
	wire [31:0] m_din, s_din;
	
	// instance module bus
	bus test_bus(clk, reset_n, m0_req, m0_wr, m0_address, m0_dout, m1_req, m1_wr,
					 m1_address, m1_dout, s0_dout, s1_dout, m0_grant, m1_grant, m_din,
					 s0_sel, s1_sel, s_address, s_wr, s_din);
	
	
	parameter T = 10;
	
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; reset_n = 0; clk = 0; 
		
		#0; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b0, 8'h00, 1'b0, 32'h0000_0000};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h00, 1'b0, 32'h0000_0000};
				{s0_dout, s1_dout} = {32'h0000_0000, 32'h0000_0000};
				
		#2; reset_n = 1'b1;
		
		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h00, 1'b0, 32'h0000_0000};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h00, 1'b0, 32'h0000_0000};		
				{s0_dout, s1_dout} = {32'h0000_0001, 32'h0000_0002};
				
		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h00, 1'b1, 32'h0000_0000};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h00, 1'b0, 32'h0000_0001};			

		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h01, 1'b1, 32'h0000_0002};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h01, 1'b0, 32'h0000_0001};			

		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h02, 1'b1, 32'h0000_0004};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h02, 1'b0, 32'h0000_0001};				

		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h03, 1'b1, 32'h0000_0006};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h03, 1'b0, 32'h0000_0001};
		
		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h20, 1'b1, 32'h0000_0020};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h20, 1'b0, 32'h0000_0002};

		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'h21, 1'b1, 32'h0000_0022};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'h21, 1'b0, 32'h0000_0002};				
		
		#T; 	{m0_req, m0_address, m0_wr, m0_dout} = {1'b1, 8'ha0, 1'b1, 32'h0000_ffff};
				{m1_req, m1_address, m1_wr, m1_dout} = {1'b0, 8'ha0, 1'b0, 32'h0000_0000};	
	
		#T; $stop;
	end	

endmodule
