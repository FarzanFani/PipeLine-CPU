module If_ID_Test;
	
	reg clk, startin, IFID_write;
	reg [31:0] instruction, pcIn;
	wire [31:0] ins, pc;

	IF_ID UUT(startin, clk, instruction, pcIn, ins, pc, IFID_write);

	initial begin
		clk = 0;
		startin = 1;
		instruction = 30;
		pcIn = 8;
		IFID_write = 1;
		#100;
		startin = 0;
		IFID_write = 0;
		#100;
		startin = 0;
		IFID_write = 1;
	end
	always #100 clk = ~clk;
endmodule
