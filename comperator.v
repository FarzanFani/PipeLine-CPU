module comprator(input1, input2, out);
	input [31:0] input1, input2;
	output out;
	assign out = (input1 == input2);
endmodule
