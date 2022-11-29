module hazard_detection_unit(IDEX_memread, IDEX_rt, IFID_rs, IFID_rt, PCWrite, IFID_write, memRegWriteSelection);
	input IDEX_memread;
	input [4:0] IDEX_rt, IFID_rs, IFID_rt;
	output reg PCWrite, IFID_write, memRegWriteSelection;
	
	always @(*) begin
	
		PCWrite <= 1;
		IFID_write <= 1;
		memRegWriteSelection <= 1;
			//lw s1 0(t1)
			//add t2 s1 s2
		if(IDEX_memread && (IDEX_rt == IFID_rs || IDEX_rt == IFID_rt)) begin
			PCWrite <= 0;
			IFID_write <= 0;
			memRegWriteSelection <= 0;	
		end
	end
endmodule 	
