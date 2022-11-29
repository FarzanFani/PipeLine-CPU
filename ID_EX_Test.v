module ID_EX_Test;

	reg startin,clk;
	reg [31:0] read1In, read2In, signExtendedIn;
	reg [4:0] ins20_16In, ins15_11In, ins25_21In;
	reg regdstIn, jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, alusrcIn, regwriteIn;
	reg [1:0] aluopIn;
	
	wire [31:0] read1, read2, signExtended;
	wire [4:0] ins20_16, ins15_11, ins25_21;
	wire regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;
	wire [1:0] aluop;

	ID_EX UUT(startin, clk, regdstIn, jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, alusrcIn, regwriteIn, aluopIn, read1In, read2In,
		signExtendedIn, ins20_16In, ins15_11In, ins25_21In,
		regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite, aluop,read1,read2,signExtended,ins20_16,
		ins15_11, ins25_21);

	initial begin
		clk = 0;
		startin = 1;
		read1In = 8;
		read2In = 10;
		signExtendedIn = 25;
		ins20_16In = 4;
		ins15_11In = 5;
		ins25_21In = 6;
		regdstIn = 1;
		jumpIn = 0;
		branchIn = 1;
		memreadIn = 0;
		memtoregIn = 1;
		memwriteIn = 0;
		alusrcIn = 1;
		regwriteIn = 0;
		aluopIn = 2;
		#100;
		startin = 0;
	end
	always #100 clk = ~clk;
endmodule

