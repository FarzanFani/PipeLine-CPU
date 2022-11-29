module main_pipeline(clk, startin, regNo , val);
	
	input wire startin, clk;
	input wire [4:0]  regNo;
	output wire [31:0] val;
	wire regdst, jump, branch, memread, memtoreg, alusrc, memwrite, regwrite, zero;
	wire [1:0] aluop;
	wire [4:0] WriteReg;
	wire [31:0] pcOut, instruction, regFileData1, regFileData2, signedExtended, 
	aluResult, dataMemoryReadData, aluIn2, pcIn, adderSE_PC4_result, 
	signedExtendedShiftLeft2, pcOut4, WriteData;
	
	
	wire [3:0] AlucontrolV;
	
	
	wire[31:0] IF_ID_pc4, IF_ID_instruction;
	
	
	
	wire [31:0] ID_EX_read1, ID_EX_read2, ID_EX_signExtended;
	wire [4:0] ID_EX_ins20_16, ID_EX_ins15_11, ID_EX_ins25_21;
	wire ID_EX_regdst, ID_EX_jump, ID_EX_branch, ID_EX_memread, ID_EX_memtoreg, ID_EX_memwrite, ID_EX_alusrc, ID_EX_regwrite;
	wire [1:0] ID_EX_aluop;
	
	
	
	wire EX_MEM_jump, EX_MEM_branch, EX_MEM_memread, EX_MEM_memtoreg, EX_MEM_memwrite, EX_MEM_regwrite;
	wire EX_MEM_zero;
	wire [31:0] EX_MEM_aluResult, EX_MEM_read2;
	wire [4:0] EX_MEM_regDstMux;
	
	
	
	wire MEM_WB_jump, MEM_WB_memtoreg, MEM_WB_regwrite;
	wire [31:0] MEM_WB_aluResult, MEM_WB_memReadData;
	wire [4:0] MEM_WB_regDstMux;
	
	
	wire [1:0] forwardA, forwardB;
	wire [31:0] aluIn1, aluMuxIn;
	
	
	
	wire compRes;
	
	
	wire PCWrite, IFID_write, memRegWriteSelection;
	

		

		PC firstPcOut(pcOut, pcIn, PCWrite, clk, startin);
		
		InstructionMemory InsMem (pcOut, instruction, startin);
		
		Adder pcAdder (pcOut, 32'b100, pcOut4);
		
		
		IF_ID ifid (.startin(startin), .clk(clk), .instruction(instruction), .pcIn(pcOut4), .ins(IF_ID_instruction), .pc(IF_ID_pc4), .IFID_write(IFID_write));
		
		ControlUnit CntrlUnit (IF_ID_instruction[31:26], regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
		
		RegisterFile RegFile (IF_ID_instruction[25:21], IF_ID_instruction[20:16], MEM_WB_regDstMux, WriteData, MEM_WB_regwrite, regFileData1, regFileData2, startin, clk, val, regNo);

		SignExtend signEx (IF_ID_instruction[15:0], signedExtended);

		ShiftLeft2 shiftleft_2 (signedExtended, signedExtendedShiftLeft2);
		
		Adder adderSE_PC4 (IF_ID_pc4, signedExtendedShiftLeft2, adderSE_PC4_result);
		
		comprator comp (regFileData1, regFileData2, compRes);
		
		hazard_detection_unit hazard_detection(ID_EX_memread, ID_EX_ins20_16, IF_ID_instruction[25:21], IF_ID_instruction[20:16], PCWrite, IFID_write, memRegWriteSelection);
		wire branchCompRes = branch && compRes;
		
		Mux_32 muxFinal (pcOut4, adderSE_PC4_result, branchCompRes, pcIn);
		
		wire regdst2, jump2, branch2, memread2, memtoreg2, alusrc2, memwrite2, regwrite2;
		wire [1:0] aluop2;
		assign { regdst2, jump2, branch2, memread2, memtoreg2, aluop2, memwrite2, alusrc2, regwrite2 } = (memRegWriteSelection == 1) ? { regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite } : 0;
		
		
		
		ID_EX idex(.startin(startin), .clk(clk), 
				.regdstIn(regdst2), .jumpIn(jump2), .branchIn(branch2), .memreadIn(memread2), .memtoregIn(memtoreg2), .memwriteIn(memwrite2), .alusrcIn(alusrc2), .regwriteIn(regwrite2), .aluopIn(aluop2),
				.read1In(regFileData1), .read2In(regFileData2), .signExtendedIn(signedExtended), .ins20_16In(IF_ID_instruction[20:16]), .ins15_11In(IF_ID_instruction[15:11]), .ins25_21In(IF_ID_instruction[25:21]),
				
				.regdst(ID_EX_regdst), .jump(ID_EX_jump), .branch(ID_EX_branch), .memread(ID_EX_memread), .memtoreg(ID_EX_memtoreg), .memwrite(ID_EX_memwrite), .alusrc(ID_EX_alusrc), .regwrite(ID_EX_regwrite), .aluop(ID_EX_aluop),
			   .read1(ID_EX_read1),   .read2(ID_EX_read2),   .signExtended(ID_EX_signExtended),   .ins20_16(ID_EX_ins20_16),   .ins15_11(ID_EX_ins15_11), .ins25_21(ID_EX_ins25_21) );
		
		
		
		
		
		
		Mux_5 mux5 (ID_EX_ins20_16,ID_EX_ins15_11, ID_EX_regdst, WriteReg);
		
		ALUControl Alu_Control (ID_EX_signExtended[5:0], ID_EX_aluop, AlucontrolV);
		
		forwardUnit f_unit(EX_MEM_regwrite, MEM_WB_regwrite, ID_EX_ins20_16, ID_EX_ins25_21, EX_MEM_regDstMux, MEM_WB_regDstMux, forwardA, forwardB);
		
		mux_32_3 mux32_3_1 (ID_EX_read1, WriteData, EX_MEM_aluResult, forwardA, aluIn1);
		
		mux_32_3 mux32_3_2 (ID_EX_read2, WriteData, EX_MEM_aluResult, forwardB, aluMuxIn);
		
		Mux_32 mux32 (aluMuxIn, ID_EX_signExtended, ID_EX_alusrc, aluIn2);
		
		ALU AL_U (aluIn1, aluIn2, AlucontrolV, aluResult, zero);
		

		EX_MEM exmem(.startin(startin), .clk(clk),
				
				.jumpIn(ID_EX_jump), .branchIn(ID_EX_branch), .memreadIn(ID_EX_memread), .memtoregIn(ID_EX_memtoreg), .memwriteIn(ID_EX_memwrite), .regwriteIn(ID_EX_regwrite),
				.zeroIn(zero), .aluResultIn(aluResult), .regDstMuxIn(WriteReg), .read2In(ID_EX_read2),
				
				.jump(EX_MEM_jump), .branch(EX_MEM_branch), .memread(EX_MEM_memread), .memtoreg(EX_MEM_memtoreg), .memwrite(EX_MEM_memwrite), .regwrite(EX_MEM_regwrite),
				.zero(EX_MEM_zero), .aluResult(EX_MEM_aluResult), .regDstMux(EX_MEM_regDstMux), .read2(EX_MEM_read2));
		
		
		
		
		DataMemory data_mem (EX_MEM_aluResult, EX_MEM_read2, EX_MEM_memwrite, EX_MEM_memread, dataMemoryReadData, startin, clk);		
		MEM_WB memwb(.startin(startin), .clk(clk),
			
				.regwriteIn(EX_MEM_regwrite), .jumpIn(EX_MEM_zero), .memtoregIn(EX_MEM_memtoreg),
				.aluResultIn(EX_MEM_aluResult), .memReadDataIn(dataMemoryReadData), .regDstMuxIn(EX_MEM_regDstMux),
				
				.regwrite(MEM_WB_regwrite), .jump(MEM_WB_jump), .memtoreg(MEM_WB_memtoreg),
				.aluResult(MEM_WB_aluResult), .memReadData(MEM_WB_memReadData), .regDstMux(MEM_WB_regDstMux));
		
		
		
		Mux_32 mux32_2 (MEM_WB_aluResult, MEM_WB_memReadData, MEM_WB_memtoreg, WriteData);
		
		
		
	
endmodule
