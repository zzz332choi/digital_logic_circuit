`timescale 1ns/100ps

module tb_FactoCore;

	// regs & wires
	reg s_sel, s_wr, reset_n, clk;
	reg [15:0]	s_addr;
	reg [63:0]	s_din;
	
	wire [63:0]	s_dout;
	wire interrupt;
	
	
	parameter T = 10;
	always #(T/2) clk = ~clk;
	
	// instance Factorialcore module
	FactoCore test(s_sel, s_wr, s_addr, s_din, reset_n, clk, s_dout, interrupt);

	initial begin
		#0; clk = 0; s_sel = 0; s_wr = 0; s_addr = 16'h7010; s_din = 64'h1; reset_n = 0;
		#T; reset_n = 1; s_wr = 1; s_addr = 16'h7018; s_din = 64'd0; // write interrupt
		#T; s_din = 64'd8; s_addr = 16'h7030; 
		#T; s_sel = 1; s_wr = 0; s_addr = 16'h7010;	// read opdone
		
		#T; s_addr = 16'h7008; s_wr = 1; s_din = 64'b1; // clear
		#T; s_din = 64'b0; // clear down
		#T; s_sel = 1; s_addr = 16'h7018; s_din = 64'd0; s_wr = 1; // write interrupt
		#T; s_sel = 1; s_addr = 16'h7020; s_din = 64'd5; s_wr = 1; // operand = 5
		#T; s_addr = 16'h7000; s_din = 64'b1;	// start 
		#T; s_wr = 0; s_addr = 16'h7010;	// read opdone
		//#T; s_sel = 1; s_wr = 0; s_addr = 16'h7030;	// read result_l
		#(150*T); s_addr = 16'h7028; // read result_h
		#T; s_addr = 16'h7030; // read result_low
		
		// 0!
		#T; s_sel = 1; s_wr = 1; s_addr = 16'h7008; s_din = 64'b1; // clear
		#T; s_din = 64'b0; // clear down
		#T; s_wr = 1; s_addr = 16'h7018; s_din = 64'd1; // write interrupt
		#T; s_wr = 1; s_addr = 16'h7020; s_din = 64'd0; // write operand
		#T; s_wr = 1; s_addr = 16'h7000; s_din = 64'b1; // start 
		#T; s_wr = 0; s_addr = 16'h7010; // read opdone
		#(40*T); s_addr = 16'h7030; // read result_l
		
		// 1!
		#T; s_sel = 1; s_wr = 1; s_addr = 16'h7008; // clear
		#T; s_din = 64'b0;		// clear down
		#T; s_wr = 1; s_addr = 16'h7018; s_din = 64'd1; // write interrupt
		#T; s_wr = 1; s_addr = 16'h7020; s_din = 64'd1; // write operand
		#T; s_wr = 1; s_addr = 16'h7000; 
		#T; s_wr = 0; s_addr = 16'h7010; // read opdone
		#(40*T); s_addr = 16'h7030; // read result_l		
		
		// 16!
		#T; s_sel = 1; s_wr = 1; s_addr = 16'h7008; // clear
		#T; s_din = 64'b0;		// clear down
		#T; s_wr = 1; s_addr = 16'h7018; s_din = 64'd0; // write interrupt
		#T; s_wr = 1; s_addr = 16'h7020; s_din = 64'd16; // write operand
		#T; s_wr = 1; s_addr = 16'h7000; s_din = 64'b1; // start 
		#T; s_wr = 0; s_addr = 16'h7010; // read opdone
		//#T; s_sel = 1; s_wr = 0; s_addr = 16'h7030;	// read result_l
		#(570*T); s_addr = 16'h7030; // read result_l				
		
		// 18!
		#T; s_sel = 1; s_wr = 1; s_addr = 16'h7008; // clear
		#T; s_din = 64'b0;		// clear down
		#T; s_wr = 1; s_addr = 16'h7018; s_din = 64'd0; // write interrupt
		#T; s_wr = 1; s_addr = 16'h7020; s_din = 64'd18; // write operand
		#T; s_wr = 1; s_addr = 16'h7000; s_din = 64'b1; // start 
		#T; s_wr = 0; s_addr = 16'h7010; // read opdone
		//#T; s_sel = 1; s_wr = 0; s_addr = 16'h7030;	// read result_l
		#(630*T); s_addr = 16'h7030; // read result_l	
		
		// 19!
		#T; s_sel = 1; s_wr = 1; s_addr = 16'h7008; // clear
		#T; s_din = 64'b0;		// clear down
		#T; s_wr = 1; s_addr = 16'h7018; s_din = 64'd0; // write interrupt
		#T; s_wr = 1; s_addr = 16'h7020; s_din = 64'd19; // write operand
		#T; s_wr = 1; s_addr = 16'h7000; s_din = 64'b1; // start 
		#T; s_wr = 0; s_addr = 16'h7010; // read opdone
		//#T; s_sel = 1; s_wr = 0; s_addr = 16'h7030;	// read result_l
		#(660*T); s_addr = 16'h7030; // read result_l	
		
		#(10*T); $stop;
		
		
	end
	
endmodule
