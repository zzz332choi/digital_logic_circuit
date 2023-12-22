`timescale 1ns/100ps

module tb_my_cla8;

	reg[7:0] a, b; // 32bit reg
	reg ci; 			// reg

	wire co; 		// wire
	wire[7:0] s; 	// wire

	my_cla8 teset_my_cla8(a, b, ci, co, s);
	
	initial begin
		#0; {a, b, ci} = {8'd5, 8'd2, 1'b0};
		#5; {a, b, ci} = {8'd10, 8'd8, 1'b0};
		#5; {a, b, ci} = {8'd20, 8'd30, 1'b0};
		#5; {a, b, ci} = {8'd100, 8'd11, 1'b0};
		#5;
	end

endmodule
