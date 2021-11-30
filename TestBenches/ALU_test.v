`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   04:26:30 11/09/2021
// Design Name:   ALU
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/ALU_test.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_test;

	// Inputs
	reg [31:0] Input1;
	reg [31:0] Input2;
	reg isTwoC;
	reg [1:0] Operation;
	reg [2:0] SetFlag;
	reg LeftOrRight;
	reg isArith;

	// Outputs
	wire zero;
	wire [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.zero(zero), 
		.Result(Result), 
		.Input1(Input1), 
		.Input2(Input2), 
		.isTwoC(isTwoC), 
		.Operation(Operation), 
		.SetFlag(SetFlag), 
		.LeftOrRight(LeftOrRight), 
		.isArith(isArith)
	);

	initial begin
		// Initialize Inputs
		Input1 = 0;
		Input2 = 0;
		isTwoC = 0;
		Operation = 0;
		SetFlag = 0;
		LeftOrRight = 0;
		isArith = 0;

		// Wait 100 ns for global reset to finish
		#100;
		// Addition
      #10 Input1 = 32'b00101010100001010101111011001101; Input2 = 32'b10011010101001010101111011001101; isTwoC = 0; Operation = 00; SetFlag = 111; LeftOrRight = 0; isArith = 0;
		// 2's Complement
		#10 Input1 = 32'b00101010100001010101111011001101; Input2 = 32'b00101010100001010101111011001101; isTwoC = 1; Operation = 00; SetFlag = 000; LeftOrRight = 0; isArith = 0;
		
		#10 $finish;
	end
   
	initial begin
		$monitor("Input1 = %b, Input2 = %b, Result = %b, Zero = %b, isTwoC = %b, Operation = %b, SetFlag = %b, isArith = %b", Input1, Input2, Result, zero, isTwoC, Operation, SetFlag, isArith);
	end
endmodule

