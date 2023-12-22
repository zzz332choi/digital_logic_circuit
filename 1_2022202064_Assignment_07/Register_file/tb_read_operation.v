`timescale 1ns/100ps

module tb_read_operation;

	reg [31:0]	from_reg0, from_reg1, from_reg2, from_reg3,
						from_reg4, from_reg5, from_reg6, from_reg7;	// 32bits reg ports
						
	reg [2:0]		Addr;	// 3bits reg port
	wire [31:0]	Data; // 32bits wire port

	// Instance read_operation
	read_operation test_read_operation (.Addr(Addr), .Data(Data),
						.from_reg0(from_reg0), .from_reg1(from_reg1), .from_reg2(from_reg2), .from_reg3(from_reg3),
						.from_reg4(from_reg4), .from_reg5(from_reg5), .from_reg6(from_reg6), .from_reg7(from_reg7));
						
	initial begin
		#0; from_reg0 = 32'h0000_0000; from_reg1 = 32'h1111_1111; from_reg2 = 32'h2222_2222; from_reg3 = 32'h3333_3333;
			 from_reg4 = 32'h4444_4444; from_reg5 = 32'h5555_5555; from_reg6 = 32'h6666_6666; from_reg7 = 32'h7777_7777;
	
		#5; Addr = 3'b000;
		#5; Addr = 3'b001;
		#5; Addr = 3'b010;
		#5; Addr = 3'b011;
		#5; Addr = 3'b100;
		#5; Addr = 3'b101;
		#5; Addr = 3'b110;
		#5; Addr = 3'b111;
		#5;
	end
	
endmodule
