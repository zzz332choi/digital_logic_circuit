module mux2_16bit(a, b, s, y);

	// input ports & output port
	input [15:0] a, b;
	input s;
	output reg [15:0] y;
	
	always @ (*) begin
		if(s == 1'b0) y <= a;
		else y <= b;
	end
	
endmodule
