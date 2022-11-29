module SignExtend(in, result);
	
	input [15:0] in;
	output reg[31:0] result;
	always @(in) begin
			
		if(in[15] == 0) begin
			
			result <= {16'b0, in};
		end else begin
			
			result <= {16'b1111111111111111, in};
		end
		
	end
	
endmodule
