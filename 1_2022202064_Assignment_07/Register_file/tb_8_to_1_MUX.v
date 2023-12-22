`timescale 1ns/100ps

module tb_8_to_1_MUX;
	
	reg 	[31:0]	a, b, c, d, e, f, g, h; // 32bits regs
	reg	[2:0]		sel;							// 3bits reg
	wire	[31:0]	d_out;						// 32bits wire
	
	
	_8_to_1_MUX test_8_to_1_MUX(.a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .h(h), .sel(sel), .d_out(d_out));
	
	initial begin
		a = 32'h1111_1111; b = 32'h2222_2222; c = 32'h3333_3333; d = 32'h4444_4444;
		e = 32'h5555_5555; f = 32'h6666_6666; g = 32'h7777_7777; h = 32'h8888_8888;
		
		#5; sel = 3'd0;	
		#5; sel = 3'd1;	// expected = 32'h1111_1111
		#5; sel = 3'd2;	// expected = 32'h2222_2222
		#5; sel = 3'd3;	// expected = 32'h3333_3333
		#5; sel = 3'd4;	// expected = 32'h4444_4444
		#5; sel = 3'd5;	// expected = 32'h5555_5555
		#5; sel = 3'd6;	// expected = 32'h6666_6666
		#5; sel = 3'd7;	// expected = 32'h7777_7777
		#5;					// expected = 32'h8888_8888
		
	end
	
	
endmodule
