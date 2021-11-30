`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:33:50 11/07/2021
// Design Name:   ALUControl
// Module Name:   /home/abhilash/Desktop/Verilog_files/KGPRISC/ALUControlTester.v
// Project Name:  KGPRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALUControl
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUControlTester;

	// Inputs
	reg [7:0] ALUop;

	// Outputs
	wire isArith;
	wire isTwoC;
	wire LeftOrRight;
	wire [1:0] Operation;
	wire [2:0] SetFlag;

	// Instantiate the Unit Under Test (UUT)
	ALUControl uut (
		.ALUop(ALUop), 
		.isArith(isArith), 
		.isTwoC(isTwoC), 
		.LeftOrRight(LeftOrRight), 
		.Operation(Operation), 
		.SetFlag(SetFlag)
	);

	initial begin
		// Initialize Inputs
		ALUop = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 ALUop = 8'b01010101;
		#10 ALUop = 8'b10101111;
		#10;
		$finish;
		
	end
	
	initial begin
		$monitor("ALUop = %b, isArith = %b, isTwoC = %b, LeftOrRight = %b, Operation = %b, SetFlag = %b\n",ALUop, isArith, isTwoC, LeftOrRight, Operation, SetFlag);
	end
			
endmodule

