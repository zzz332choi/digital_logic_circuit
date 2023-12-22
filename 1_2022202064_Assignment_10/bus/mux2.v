module mux2(a, b, s, y);

	// input ports & output port
	input a, b, s;
	output reg y;
	
	always @ (*) begin
		if(s == 1'b0) y <= a;
		else y <= b;
	end
	
endmodule
