module ALU(in1, in2, operation, out, zero);

	output reg [31:0] out;
	output reg zero;
	input  [31:0] in1, in2;
	input  [3:0] operation;

	always @(*) begin
	
		if(operation == 4'b0010) begin
			
			out <= in1 + in2;
			if(in1 + in2 == 0)
				zero <= 1;
			else
				zero <= 0;
		end else
		if(operation == 4'b0110) begin
			
			out <= in1 - in2;
			if(in1 - in2 == 0)
				zero <= 1;
			else
				zero <= 0;
		end else
		if(operation == 4'b0000) begin
			
			out <= in1 & in2;
			if(in1 && in2 == 0)
				zero <= 1;
			else
				zero <= 0;
		end else
		if(operation == 4'b0001) begin
			
			out <= in1 | in2;
			if(in1 | in2 == 0)
				zero <= 1;
			else
				zero <= 0;
		end else
		if(operation == 4'b0111) begin
			
			out <= in1 < in2;
			zero <= 0;
		end
	
	end

endmodule
