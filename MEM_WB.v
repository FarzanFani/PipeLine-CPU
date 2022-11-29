module MEM_WB(startin, clk,regwriteIn, jumpIn, memtoregIn,aluResultIn, memReadDataIn, regDstMuxIn,regwrite, jump, memtoreg,aluResult, memReadData, regDstMux);
				
		input startin, clk;
		
		input jumpIn, memtoregIn, regwriteIn;
		input [31:0] aluResultIn, memReadDataIn;
		input [4:0] regDstMuxIn;	
		
		output reg jump, memtoreg, regwrite;
		output reg [31:0] aluResult, memReadData;
		output reg [4:0] regDstMux;
				
		always @(posedge clk) begin
			if(startin) begin
				
				{ jump, memtoreg, regwrite, aluResult, memReadData, regDstMux} <= 0;
			
			end else begin
				regwrite <= regwriteIn;
				jump <= jumpIn;
				memtoreg <= memtoregIn;
				aluResult <= aluResultIn;
				memReadData <= memReadDataIn;
				regDstMux <= regDstMuxIn;
			end
		end	

endmodule
