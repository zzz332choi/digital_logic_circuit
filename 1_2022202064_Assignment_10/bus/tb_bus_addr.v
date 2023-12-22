`timescale 1ns/100ps

module tb_bus_addr;

	// reg & wires
	reg [7:0] address;
	wire s0_sel, s1_sel;
	
	// instance module bus_addr
	bus_addr test_bus_addr(address, s0_sel, s1_sel);
	
	initial begin
		#0; address = 8'hff;
		#5; address = 8'h0f;
		#5; address = 8'h1f;
		#5; address = 8'h20;
		#5; address = 8'h25;
		#5; address = 8'h30;
		#5; address = 8'h40;
		#5;		
	end
		
endmodule
