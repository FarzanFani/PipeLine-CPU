module IF_ID(startin, clk, instruction, pcIn, ins, pc, IFID_write);
	input clk, startin, IFID_write;
	input [31:0] instruction, pcIn;
	output reg [31:0] ins, pc;
	always @(posedge clk) begin
		if(startin) begin
			ins <= 0;
			pc <= 0;
		end else begin
			if(IFID_write) begin
				ins <= instruction;
				pc <= pcIn;
			end
		end
	
	end

endmodule
