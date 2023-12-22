module Facto_os(s_dout, s_sel, s_wr, opdone, result_h, result_l, offset_upper);
	
	// input ports & output ports 
	input s_sel, s_wr;
	input [4:0] offset_upper; // offset upper 5bits
	input [63:0] opdone, result_h, result_l;
	output reg[63:0] s_dout;
	
	always @(*) begin
		case({s_sel, s_wr, offset_upper})
			// output logic
			{1'b1, 1'b0, 5'h2} : s_dout = opdone;	
			{1'b1, 1'b0, 5'h5} : s_dout = result_h;
			{1'b1, 1'b0, 5'h6} : s_dout = result_l;
			default: s_dout = 64'b0;
		endcase	
	end
	
endmodule
