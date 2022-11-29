/*module Main(clk, startin, regNo , val);
	
	input wire startin, clk;
	input wire [4:0]  regNo;
	output wire [31:0] val;
	wire regdst, jump, branch, memread, memtoreg, alusrc, memwrite, regwrite, zero;
	wire [1:0] aluop;
	wire [4:0] WriteReg;
	wire [31:0] pcOut, instruction, regFileData1, regFileData2, signedExtended, 
	aluResult, dataMemoryReadData, aluIn2, pcIn, adderSE_PC4_result, pcCounter_mux32_result, 
	signedExtendedShiftLeft2, pcOut4, WriteData;
	
	
	wire [3:0] AlucontrolV;
	wire [27:0] shift_2628;
	
		
		PC firstPcOut(pcOut, pcIn, clk, startin);
		
		InstructionMemory InsMem (pcOut, instruction, startin);
		
		ControlUnit CntrlUnit (instruction[31:26], regdst, jump, branch, memread, memtoreg, aluop, memwrite, alusrc, regwrite);
		
		Mux_5 mux5 (instruction[20:16],instruction[15:11], regdst, WriteReg);
		
		RegisterFile RegFile (instruction[25:21], instruction[20:16], WriteReg, WriteData, regwrite, regFileData1, regFileData2, startin, clk, val, regNo);
		
		SignExtend signEx (instruction[15:0], signedExtended);
		
		ALUControl Alu_Control (instruction[5:0], aluop, AlucontrolV);
		
		Mux_32 mux32 (regFileData2, signedExtended, alusrc, aluIn2);
		
		ALU AL_U (regFileData1, aluIn2, AlucontrolV, aluResult, zero);
		
		DataMemory data_mem (aluResult, regFileData2, memwrite, memread, dataMemoryReadData, startin, clk);
		
		Mux_32 mux32_2 (aluResult, dataMemoryReadData, memtoreg, WriteData);
		
		
		Adder pcAdder (pcOut, 32'b100, pcOut4);
		
		
		ShiftLeft2 shiftleft_2 (signedExtended, signedExtendedShiftLeft2);
		
		Adder adderSE_PC4 (pcOut4, signedExtendedShiftLeft2, adderSE_PC4_result);
		
		wire branchAndZero = branch && zero;
		Mux_32 pcCounter_mux32 (pcOut4, adderSE_PC4_result, branchAndZero ,pcCounter_mux32_result);
		
		
		Shift_26_28 shift_26_28 (instruction[25:0], shift_2628);
		
		
		
		Mux_32 muxFinal (pcCounter_mux32_result,{pcOut4[31:28],shift_2628}, jump, pcIn);
		

	
	
endmodule
*/
