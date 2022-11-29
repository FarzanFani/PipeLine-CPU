module MEM_WB_Test;

	reg startin, clk;
	reg jumpIn, memtoregIn, regwriteIn;
	reg [31:0] aluResultIn, memReadDataIn;
	reg [4:0] regDstMuxIn;	
		
	wire jump, memtoreg, regwrite;
	wire [31:0] aluResult, memReadData;
	wire [4:0] regDstMux;

	MEM_WB UUT(startin, clk,regwriteIn, jumpIn, memtoregIn,aluResultIn, memReadDataIn, regDstMuxIn,regwrite, jump, memtoreg,aluResult
		   ,memReadData, regDstMux);

	initial begin
		clk = 0;
		startin = 1;
		jumpIn = 1;
		memtoregIn = 1;
		regwriteIn = 0;
		aluResultIn = 40;
		memReadDataIn = 40;
		regDstMuxIn = 17;
		#100;
		startin = 0;
	end
	always #100 clk = ~clk;
endmodule
