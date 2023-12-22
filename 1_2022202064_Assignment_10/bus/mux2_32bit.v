module mux2_32bit(a, b, s, y);

	// input ports & output port
	input [31:0] a, b;
	input s;
	output reg [31:0] y;
	
	always @ (*) begin
		if(s == 1'b0) y <= a;
		else y <= b;
	end
	
endmodule
