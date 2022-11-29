module ALUControl(Func, Aluop, Alucontrol);
	input [1:0] Aluop;
	input [5:0] Func;
	output reg [3:0]  Alucontrol;
	
	always @(*) begin
		
		if(Aluop == 2'b11) begin
			
			Alucontrol <= 4'b0010;
		end else if(Aluop == 2'b01) begin
			
			Alucontrol <= 4'b0110;
		end else if(Aluop == 0) begin
			
			if(Func == 0 || Func == 6'b100000) begin
				
				Alucontrol <= 4'b0010;
			end else 
			if (Func == 1 || Func == 6'b100010) begin
				
				Alucontrol <= 4'b0110;
			end else 
			if (Func == 2 || Func == 6'b100100) begin
				
				Alucontrol <= 4'b0000;
			end else 
			if (Func == 3 || Func == 6'b100101) begin
				
				Alucontrol <= 4'b0001;
			end else 
			if (Func == 4 || Func == 6'b101010) begin
				
				Alucontrol <= 4'b0111;
			end
		end
		
	end
	
endmodule
