module tb_BUS;
	
	// regs & wires
	reg clk, reset_n, m_req, m_wr;
	reg [15:0] m_addr;
	reg [63:0] m_dout, s0_dout, s1_dout;
	
	wire s0_sel, s1_sel, m_grant, s_wr;
	wire [15:0] s_addr;
	wire [63:0] s_din, m_din;
	
	parameter T = 10;
	
	always #(T/2) clk = ~clk; 
	
	BUS test_BUS(m_req, m_wr, m_addr, m_dout, m_grant, m_din, reset_n, clk, s0_sel, s1_sel, s_addr, s_din, s_wr, s0_dout, s1_dout);
	
	
	initial begin
		#0; reset_n = 1'b0; clk = 1'b0; m_req = 1'b0; m_wr = 1'b0; m_addr = 16'h0000;
			 s0_dout = 64'habcdabcd_abcdabcd; s1_dout = 64'h12341234_12341234;
			 m_dout = 64'h111111;
			 
		#T; reset_n = 1; m_addr = 16'hf0f0; m_dout = 64'h2222222;
		#T; m_req = 1'b1; m_addr = 16'h70cc; m_dout = 64'h2225655555; 
		#T; m_addr = 16'h00aa; m_wr = 1; m_dout = 64'h22256aaaa;
		#T; m_wr = 0;
		#T; m_wr = 1; m_req = 0;
		#T; m_addr = 16'h07ff;  m_dout = 64'hfffffffff;
		#T; m_addr = 16'h0800;
		#T; m_addr = 16'h7000; m_req = 1; m_wr = 0;  m_dout = 64'hffabcdabcd999f;
		#T; $stop;
		
	end
	
	
endmodule
