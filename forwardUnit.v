module forwardUnit(ex_mem_regwrite, mem_wb_regwrite, id_ex_rt, id_ex_rs, ex_mem_rd, mem_wb_rd, forwardA, forwardB);
	input [4:0] id_ex_rt, id_ex_rs, ex_mem_rd, mem_wb_rd;
	input ex_mem_regwrite, mem_wb_regwrite;
	output reg [1:0] forwardA, forwardB;
		
	always @(*) begin
		forwardB <= 0;
		forwardA <= 0;
			// add t1 t2 t3
			// add t4 t1 t3
		if(ex_mem_regwrite && ex_mem_rd == id_ex_rt && ex_mem_rd != 0)
			forwardB <= 2;
				
		if(ex_mem_regwrite && ex_mem_rd == id_ex_rs && ex_mem_rd != 0)
			forwardA <= 2;
				//lw t1 0(t1)
				// ...
				// add t3 t1 t4
		if(mem_wb_regwrite && mem_wb_rd == id_ex_rt && mem_wb_rd != 0)
			forwardB <= 1;
				
		if(mem_wb_regwrite && mem_wb_rd == id_ex_rs && mem_wb_rd != 0)
			forwardA <= 1;
		
	end
endmodule
