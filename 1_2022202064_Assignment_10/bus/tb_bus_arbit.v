`timescale 1ns/100ps

module tb_bus_arbit;
	
	// regs & wires
	reg clk, reset_n, m0_req, m1_req;
	wire m0_grant, m1_grant;
	
	parameter T = 10;
	
	always #(T/2) clk = ~clk;
	
	// Instance module "bus_arbit"
	bus_arbit test_bus_arbit(clk, reset_n, m0_req, m1_req, m0_grant, m1_grant);
	
	initial begin
		#0; clk = 0; reset_n = 0; m0_req = 0; m1_req = 0;
		#2; reset_n = 1;
		#T; m0_req = 1; m1_req = 1;
		#T; m0_req = 0;
		#T; m1_req = 0;
		#T; m1_req = 1;
		#T; m0_req = 1;
		#T; m1_req = 0;
		
		
		//#T; m1_req = 1;
		//#T; m1_req = 0;
		//#T; m0_req = 1;
		//#T; m0_req = 0; m1_req = 1;
		//#T; m1_req = 0;
		#T; $stop;
	end

endmodule
