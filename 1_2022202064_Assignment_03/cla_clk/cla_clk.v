module cla_clk(clk, a, b, ci, co, s);
	
	input [31:0] a, b; // 32bit input bus ports
	input clk, ci; // input ports
	output [31:0] s; // 32bit output bus port
	output co; // output port
	
	reg [31:0] reg_a, reg_b, reg_s; //32bit reg
	reg reg_ci, reg_co; // reg
	wire [31:0] wire_s; // 32bit wire
	wire wire_co; // wire
	
	
	always @ (posedge clk) // flip flop
	begin

		reg_a <= a; 
		reg_b <= b;
		reg_ci <= ci;
		reg_s <= wire_s;
		reg_co <= wire_co;
		
		
	end
	
	//modified_cla32 modified_CLA32(.a(reg_a), .b(reg_b), .ci(reg_ci), .s(wire_s), .co(wire_co));
	cla32 CLA32(.a(reg_a), .b(reg_b), .ci(reg_ci), .s(wire_s), .co(wire_co)); // instance 32bit carry look ahead adder 'CLA32'
	
	assign s = reg_s; 
	assign co = reg_co;

endmodule



