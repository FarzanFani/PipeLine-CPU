module ControlUnit(instruction31_26, regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite );
	input [5:0] instruction31_26;
	output reg regdst, jump, branch, memread, memtoreg, memwrite, alusrc, regwrite;
	output reg [1:0] aluop;
	always @(instruction31_26) begin
		
		if(instruction31_26 == 35) begin
				
				regdst <= 0;
				jump <= 0;
				branch <= 0;
				memread <= 1;
				memtoreg <= 1;
				memwrite <= 0;
				alusrc <= 1;
				regwrite <= 1;
				aluop <= 2'b11;
			end
			
			//sw
			else if(instruction31_26 == 43) begin
				regdst <= 0;
				alusrc <= 1;
				memtoreg <= 0;
				regwrite <= 0;
				memread <= 0;
				memwrite <= 1;
				branch <= 0;
				aluop <= 2'b11;
				jump <= 0;
			end
			
			//addi
			else if(instruction31_26 == 8) begin
				regdst <= 0;
				alusrc <= 1;
				memtoreg <= 0;
				regwrite <= 1;
				memread <= 0;
				memwrite <= 0;
				branch <= 0;
				aluop <= 2'b11;
				jump <= 0;
			end
			
			
			//beq
			else if(instruction31_26 == 4) begin
				regdst <= 0;
				alusrc <= 0;
				memtoreg <= 0;
				regwrite <= 0;
				memread <= 0;
				memwrite <= 0;
				branch <= 1;
				aluop <= 2'b01;
				jump <= 0;
			end
			
			
			//j
			else if(instruction31_26 == 2) begin
				regdst <= 0;
				alusrc <= 0;
				memtoreg <= 0;
				regwrite <= 0;
				memread <= 0;
				memwrite <= 0;
				branch <= 0;
				aluop <= 2'b00;
				jump <= 1;
			end
			
			
			//slti
			else if(instruction31_26 == 10) begin
				regdst <= 0;
				alusrc <= 1;
				memtoreg <= 0;
				regwrite <= 1;
				memread <= 0;
				memwrite <= 0;
				branch <= 0;
				aluop <= 2'b10;
				jump <= 0;
			end
			
			//R-type
			else begin
				regdst <= 1;
				alusrc <= 0;
				memtoreg <= 0;
				regwrite <= 1;
				memread <= 0;
				memwrite <= 0;
				branch <= 0;
				aluop <= 2'b00;
				jump <= 0;
			end
	end
	
endmodule
