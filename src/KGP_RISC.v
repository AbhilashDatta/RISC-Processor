`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:31:51 11/10/2021 
// Design Name: 
// Module Name:    KGP_RISC 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module KGP_RISC(PCValue, Result, Clk, Reset, Ena);

	output[31:0] PCValue, Result;
	input Clk, Reset, Ena;

	wire[31:0] Instruction, FinAddr, TempAddr, Label1, ImmediateExtended, ReadData1, ReadData2, WriteData, AluSrc2, DataOut, WriteDataTemp, Label;
	wire[4:0] reg1, reg2;
	wire[15:0] immediate;
	wire[7:0] opcode;
	wire Change1, zero;

	// Control unit wires
	wire RegWrite, ALUSrc, MemWrite, Branch, Blop, MemToReg, IsLW, IsB;
	wire[7:0] Operation;

	// ALU Control wires
	wire isTwoC, LeftOrRight, isArith;
	wire[1:0] Opr;
	wire[2:0] SetFlag;

	ProgramCounter PC(.State(PCValue), .Ip(FinAddr), .Reset(Reset), .Clk(Clk));
	InstructionMemory InsMem(.Instruction(Instruction), .Address(PCValue), .Clk(Clk), .Ena(Ena), .Wea(1'b0), .InsInput());
	Instruction_decoder Idec(.opcode(opcode), .reg1(reg1), .reg2(reg2), .label(Label1), .immediate(immediate), .inp(Instruction), .rsVal(ReadData1));
	SignExtension sgnExt(.in(immediate), .out(ImmediateExtended));
	RegisterFile RegFile(.ReadData1(ReadData1), .ReadData2(ReadData2), .reg1(reg1), .reg2(reg2), .IsLW(IsLW), .writeData(WriteData), .RegWrite(RegWrite), .Clk(Clk), .Reset(Reset));
	Mux AluSecSrcMux(.out(AluSrc2), .a(ImmediateExtended), .b(ReadData2), .sel(ALUSrc));
	ALUControl aluControl(.ALUop(Operation), .isArith(isArith), .isTwoC(isTwoC), .LeftOrRight(LeftOrRight), .Operation(Opr), .SetFlag(SetFlag));
	ALU alu1(.zero(zero), .Result(Result), .Input1(ReadData1), .Input2(AluSrc2), .isTwoC(isTwoC), .Operation(Opr), .SetFlag(SetFlag), .LeftOrRight(LeftOrRight), .isArith(isArith));
	DataMemory DatMem(.DataOut(DataOut), .DataIn(ReadData2), .Address(Result), .Clk(Clk), .Ena(Ena), .Wea(MemWrite));
	Control centControl(.OpCode(opcode), .IsLW(IsLW), .IsB(IsB), .Branch(Branch), .ALUop(Operation), .ALUsrc(ALUSrc), .BLop(Blop), .MemToReg(MemToReg), .MemWrite(MemWrite), .RegWrite(RegWrite));Mux MemResMux(.out(WriteDataTemp), .a(DataOut), .b(Result), .sel(MemToReg));
	Mux BLMux(.out(WriteData), .a(PCValue), .b(WriteDataTemp), .sel(Blop));
	Adder_32_Bit add32Bit(.sum(TempAddr), .carry(), .input1(PCValue), .input2(1), .carryIn(0));
	AND_32_bit and32Bit(.out(Change1), .in1(Branch), .in2(zero));
	Mux BranchMux(.out(FinAddr), .a(Label), .b(TempAddr), .sel(Change1));
	Mux LabelMux(.out(Label), .a(ReadData1), .b(Label1), .sel(IsB));

endmodule
