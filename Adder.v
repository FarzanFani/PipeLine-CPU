module Adder(digit1, digit2, result);
	input [31:0] digit1, digit2;
	
	output [31:0] result;
 	

	assign result = digit1 + digit2;

endmodule
