module DataMemory(Address, WriteData, MemWrite, MemRead, ReadData, startin, clk);
	
reg [7:0] mem[0:43];
input [31:0] Address;
input [31:0] WriteData;
input MemWrite;
input MemRead;
output reg [31:0] ReadData;
input startin;
input clk;
	
always @(*) begin
	if(startin == 1)begin
		
		{mem[0],mem[1],mem[2],mem[3]} <= 32'hffffffff;
		{mem[4],mem[5],mem[6],mem[7]} <= 32'b10;
		{mem[8],mem[9],mem[10],mem[11]} <= 32'b1;
		{mem[12],mem[13],mem[14],mem[15]} <= 32'b10;
		{mem[16],mem[17],mem[18],mem[19]} <= 32'b1;
		{mem[20],mem[21],mem[22],mem[23]} <= 32'b10;
		{mem[24],mem[25],mem[26],mem[27]} <= 32'b1;
		{mem[28],mem[29],mem[30],mem[31]} <= 32'b10;
		{mem[32],mem[33],mem[34],mem[35]} <= 32'b1;
		{mem[36],mem[37],mem[38],mem[39]} <= 32'b10;
		
		
	end else begin
		if(MemRead == 1)begin
			ReadData <= {mem[Address],mem[Address+1],mem[Address+2],mem[Address+3]};
		end 
	end
		
end

always @(posedge clk) begin
	if(MemWrite == 1 && startin == 0)begin
                {mem[Address],mem[Address+1],mem[Address+2],mem[Address+3]} <= WriteData;
	end	
end

	
endmodule
