`timescale 1ns/100ps

module tb_alu4;

	reg [3:0] tb_a, tb_b, result_expected;	// 4bit reg type variables
	reg [2:0] tb_op;						// 3bit reg type variable
	reg n_expected, z_expected, c_expected, v_expected;	// reg type bariables
	wire [3:0] tb_result;					// 4bit wire
	wire tb_n, tb_z, tb_c, tb_v;			// wires
	
	reg [18:0] testvectors [1000:0]; // array of testvectors
	reg [10:0] vectornum, errors; // bookkeeping variables
	
	reg clk;
	parameter T = 10;
	
	alu4 test_alu4(.op(tb_op), .a(tb_a), .b(tb_b), .result(tb_result), .n(tb_n), .z(tb_z), .c(tb_c), .v(tb_v));	// Instance module alu4
	
	initial begin
	$readmemb("test.tv", testvectors); // binary
	vectornum = 0; errors = 0;
	clk = 1;
	end
	
	always #(T/2) clk = ~clk;	
	
	always @ (posedge clk) begin
		#1; {tb_op, tb_a, tb_b, result_expected, n_expected, z_expected, c_expected, v_expected} = testvectors[vectornum];
	end
	
	always @ (negedge clk) begin
		if ( tb_result != result_expected || tb_n != n_expected || tb_z != z_expected || tb_c != c_expected || tb_v != v_expected) begin
			$display ("Error: inputs = %b", {tb_op, tb_a, tb_b});
			$display ("	outputs = %b (%b expected)", tb_result, result_expected);
			errors = errors + 1;
		end
		
		vectornum = vectornum + 1;

		if (testvectors[vectornum] === 19'bx ) begin
			$display ("%d tests completed with %d errors", vectornum, errors);
			#T; $finish;
		end
	end
	
	
	
endmodule
