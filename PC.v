module PC(out, in, PcWrite, clk, startin);
	input [31:0] in;
	input startin, clk, PcWrite;
	output reg [31:0] out;
	
	always @(posedge clk) begin
		
		if(startin) begin
		
			out <= 32'b0;
		end else begin
			
			if(PcWrite)
				out <= in;
		end
	end

endmodule
