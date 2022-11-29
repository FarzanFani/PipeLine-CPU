module RegisterFile(Read1, Read2, WriteReg, WriteData, RegWrite, Data1, Data2, startin, clk, val, regNo);
	
	input [4:0]  Read1, Read2, WriteReg, regNo;
	input [31:0] WriteData;
	input RegWrite, startin, clk;
	output [31:0] Data1, Data2, val;
	
	reg [31:0] mem [31:0];
	integer i;
	
	always @(clk) begin
		
		if(startin) begin
			for(i = 0; i < 32; i = i + 1) begin
				mem[i] <= 0;
			end
		end
	end
	
	always @(posedge clk) begin
		
		if(RegWrite) begin
			if(WriteReg != 0)
				mem[WriteReg] <= WriteData;
		end
	end
	assign Data1 = mem[Read1];
	assign Data2 = mem[Read2];
	assign val = mem[regNo];
	
	
	
endmodule
