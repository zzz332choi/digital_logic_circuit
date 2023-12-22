`timescale 1ns/100ps

module tb_dff_r_sync_async;

	reg clk, reset_n, d; 	// reg type variables
	wire q_sync, q_async;	// wire
	
	_dff_r_sync_async test_dff_r_sync_async(.clk(clk), .d(d), .reset_n(reset_n), .q_sync(q_sync), .q_async(q_async)); // Instance async/sync d flip flop with reset 
	
	parameter T = 6;
	
	always #(T/2) clk = ~clk; // clk = ~clk every 3seconds 
	always #4 d = ~d;			  // d = ~d every 4 seconds
	always #5 reset_n = ~reset_n; // reset = ~reset_n every 5 seconds
	
	initial begin
		clk = 0; d = 1; reset_n = 1;
		#100 $stop;
	end
	
endmodule

	