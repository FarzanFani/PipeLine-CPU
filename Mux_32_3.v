module mux_32_3(input1, input2, input3, op, out);
	input [31:0] input1, input2, input3;
	input [1:0] op;
	output [31:0] out;

	assign out = op == 0 ? input1 : op == 1 ? input2 : input3;
endmodule
