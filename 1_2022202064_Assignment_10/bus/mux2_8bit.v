module mux2_8bit(a, b, s, y);

	// input ports & output port
	input [7:0] a, b;
	input s;
	output reg [7:0] y;
	
	always @ (*) begin
		if(s == 1'b0) y <= a;
		else y <= b;
	end
	
endmodule
