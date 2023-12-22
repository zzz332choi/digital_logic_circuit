module shifter8 (clk, reset_n, op, shamt, d_in, d_out);
	
	input				clk, reset_n; 	// input ports
	input [2:0]		op;				// 3bits input port
	input [1:0]		shamt;			//	2bits input port
	input [7:0]		d_in;				// 8bits input port
	output [7:0]	d_out;			//	8bits output port
	
	wire [7:0]		do_next;			// 8bits wire
	
	_register8_r 	U1 (.clk(clk), .reset_n(reset_n), .d(do_next), .q(d_out));						// Instance 8bits register with reset 
	cc_logic 		U0 (.op(op), .shamt(shamt), .d_in(d_in), .d_out(d_out), .d_next(do_next)); // Instance combinational circuit logic
	
	
endmodule // end
