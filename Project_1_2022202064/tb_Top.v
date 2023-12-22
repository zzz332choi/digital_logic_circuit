`timescale 1ns/100ps

module tb_Top;
	
	// reg & wire
	reg m_req, m_wr, reset_n, clk;
	reg [15:0] m_addr;
	reg [63:0] m_dout;
	
	wire m_grant, interrupt;
	wire [63:0] m_din;
	
	// intance module "Top"
	Top test_top(clk, reset_n, m_req, m_wr, m_addr, m_dout, m_grant, m_din, interrupt);
	
	parameter T = 10;
	
	always #(T/2) clk = ~clk;
	
	initial begin
		#0; reset_n = 0; m_req = 0; m_wr = 0; clk = 0; m_addr = 16'h7000; m_dout = 64'b1;
		#T; reset_n = 1; m_wr = 1; m_addr = 16'h0008; m_dout = 64'b0;
		// 16!
		#T; m_addr = 16'h7020; m_dout = 64'd16; m_wr = 1;	m_req = 1;// write operand
		#T; m_req = 1; m_addr = 16'h7018; m_dout = 64'b0;	// write interrupt
		#T; m_addr = 16'h7000; m_dout = 64'b1;					// write opstart
		#T; m_addr = 16'h7010; m_wr = 0;							// read  opdone
		#(650*T); m_addr = 16'h7028; 								// read result_h
		#(10*T); m_addr = 16'h7030;								// read result_l
		
		#(10*T); m_dout = m_din; m_addr = 16'h0700; m_req = 1; m_wr = 1; // save result
		#T; m_addr = 16'h7008; m_dout = 64'b1;					// write opclear
		#T; m_dout = 64'b0;											// clear down
		
		#T; m_dout = 64'h123456; m_addr = 16'h0000; m_req = 1; m_wr = 1;
		#T; m_req = 1; m_wr = 0;
		#T; m_addr = 16'h0700; m_wr = 0;
		#T; m_dout = 64'hffffff77777; m_addr = 16'h0707; m_wr = 1;	// 
		#T; m_addr = 16'h0707; m_wr = 0;
		
		// 7!
		#T; m_addr = 16'h7020; m_dout = 64'd7; m_wr = 1;	// write operand
		#T; m_req = 1; m_addr = 16'h7018; m_dout = 64'b0;	// write interrupt
		#T; m_addr = 16'h7000; m_dout = 64'b1;					// write opstart
		#T; m_addr = 16'h7010; m_wr = 0;							// read  opdone
		#(300*T); m_addr = 16'h7030; 								// read result_l
		
		#T; m_dout = m_din; m_addr = 16'h03; m_req = 1; m_wr = 1; // save result
		#T; m_addr = 16'h7008; m_dout = 64'b1;					// write opclear
		#T; m_dout = 64'b0;											// clear down
		
		#T; m_wr = 0; m_addr = 16'h03;
	
//		// 21!
//		#T; m_addr = 16'h7020; m_dout = 64'd21; m_wr = 1;	// write operand
//		#T; m_req = 1; m_addr = 16'h7018; m_dout = 64'b0;	// write interrupt
//		#T; m_addr = 16'h7000; m_dout = 64'b1;					// write opstart
//		#T; m_addr = 16'h7010; m_wr = 0;							// read  opdone
//		#(740*T); m_addr = 16'h7028; 								// read result_h
//		#(20*T); m_addr = 16'h7030;								// read result_l
//	
		#(20*T); $stop;
	end
	
endmodule
