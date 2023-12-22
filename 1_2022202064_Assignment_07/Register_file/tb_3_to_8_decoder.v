`timescale 1ns/100ps

module tb_3_to_8_decoder;

	reg [2:0]	d;	// 3bits reg
	wire [7:0]	q;	// 8bits wire
	
	_3_to_8_decoder test_3_to_8_decoder (.d(d), .q(q));	// Instance 3 to 8 decoder
	
	initial begin
		#0; d = 3'b000;
		#5; d = 3'b001;
		#5; d = 3'b010;
		#5; d = 3'b011;
		#5; d = 3'b100;
		#5; d = 3'b101;
		#5; d = 3'b110;
		#5; d = 3'b111;
		#5; 
	end

endmodule
