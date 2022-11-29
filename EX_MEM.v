module EX_MEM(startin, clk,
jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, regwriteIn,zeroIn, aluResultIn, regDstMuxIn, read2In,
jump, branch, memread, memtoreg, memwrite, regwrite,zero, aluResult, regDstMux, read2);
				
		input startin,clk;
		input jumpIn, branchIn, memreadIn, memtoregIn, memwriteIn, regwriteIn;
		input zeroIn;
		input [31:0] aluResultIn, read2In;
		input [4:0] regDstMuxIn;
		
		output reg jump, branch, memread, memtoreg, memwrite, regwrite;
		output reg zero;
		output reg [31:0] aluResult, read2;
		output reg [4:0] regDstMux;
		
	
		always @(posedge clk) begin
		if(startin) begin
		
			{jump, branch, memread, memtoreg, memwrite, regwrite, zero, aluResult, read2, regDstMux} <= 0;
		
		end else begin
			jump <= jumpIn;
			branch <= branchIn;
			memread <= memreadIn;
			memtoreg <= memtoregIn;
			memwrite <= memwriteIn;
			regwrite <= regwriteIn;
			zero <= zeroIn;
			aluResult <= aluResultIn;
			read2 <= read2In;
			regDstMux <= regDstMuxIn;
		end
		end
		
endmodule
