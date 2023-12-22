module mux3_32bit(a, b, c, s, y);

	// input ports & output port
	input [31:0] a, b, c;
	input [1:0]  s;
	output reg [31:0] y;
	
	always @ (*) begin
		if(s[1] == 1'b0) begin
			if(s[0] == 1'b0) y <= a;
			else y <= b;
		end
		else begin
			if(s[0] == 1'b0) y<= c;
			else y <= 32'bx;
		end
	end	
	
endmodule
