module ID_EX(startin, clk, 		
regdstIn, jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, alusrcIn, regwriteIn, aluopIn, read1In, read2In, signExtendedIn, ins20_16In, ins15_11In, ins25_21In,
regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite, aluop,read1,read2,signExtended,ins20_16,ins15_11, ins25_21);
				
							
	input startin,clk;
	input [31:0] read1In, read2In, signExtendedIn;
	input [4:0] ins20_16In, ins15_11In, ins25_21In;
	input regdstIn, jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, alusrcIn, regwriteIn;
	input [1:0] aluopIn;
	
	output reg [31:0] read1, read2, signExtended;
	output reg [4:0] ins20_16, ins15_11, ins25_21;
	output reg regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;
	output reg [1:0] aluop;
	
	always @(posedge clk) begin
		if(startin) begin
			{read1, read2, signExtended, ins20_16, ins15_11, ins25_21, regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite, aluop} <= 0;
		end else begin
			read1 <= read1In;
			read2 <= read2In;
			signExtended <= signExtendedIn;
			ins20_16 <= ins20_16In;
			ins15_11 <= ins15_11In;
			ins25_21 <= ins25_21In;
			regdst <= regdstIn;
			jump <= jumpIn;
			branch <= branchIn;
			memread <= memreadIn;
			memtoreg <= memtoregIn;
			memwrite <= memwriteIn;
			alusrc <= alusrcIn;
			regwrite <= regwriteIn;
			aluop <= aluopIn;
		end
		
	end
	
	
endmodule
