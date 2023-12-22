`timescale 1ns/100ps

module tb_write_operation;

	reg we;
	reg [2:0]	Addr;
	wire [7:0] to_reg;

	// Instance write operation
	write_operation test_write_operation(.we(we), .Addr(Addr), .to_reg(to_reg));
	
	
	initial begin
		#0; we = 0; Addr = 3'b000;		// to_reg = 8'b0
		#5; Addr = 3'b001;				// to_reg = 8'b0
		#5; Addr = 3'b010;				// to_reg = 8'b0
		#5; Addr = 3'b011;				// to_reg = 8'b0
		#5; Addr = 3'b111;				// to_reg = 8'b0
		#5; we = 1; 						// to_reg = 8'b10000000
		#5; Addr = 3'b010;				// to_reg = 8'b100
		#5; Addr = 3'b101;				// to_reg = 8'b100000
		#5;
	end
	
endmodule
