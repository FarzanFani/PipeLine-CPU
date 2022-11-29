module EX_MEM_Test;

	reg startin,clk;
	reg jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, regwriteIn;
	reg zeroIn;
	reg [31:0] aluResultIn, read2In;
	reg [4:0] regDstMuxIn;
		
	wire jump, branch, memread, memtoreg, memwrite, regwrite;
	wire zero;
	wire [31:0] aluResult, read2;
	wire [4:0] regDstMux;

	EX_MEM UUT(startin, clk,
jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, regwriteIn,zeroIn, aluResultIn, regDstMuxIn, read2In,
jump, branch, memread, memtoreg, memwrite, regwrite,zero, aluResult, regDstMux, read2);

	initial begin
		clk = 0;
		startin = 1;
		jumpIn = 1;
		branchIn = 0;
		memreadIn = 1;
		memtoregIn = 0; 
		memwriteIn = 1;
		regwriteIn = 0;
		zeroIn = 1;
		aluResultIn = 0;
		regDstMuxIn = 10;
		read2In = 8;
		#100;
		startin = 0;
	end
	always #100 clk = ~clk;
endmodule
		

