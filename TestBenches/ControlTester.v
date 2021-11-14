`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:51:12 11/06/2021
// Design Name:   Control
// Module Name:   /home/abhilash/Desktop/Verilog_files/KGPRISC/ControlTester.v
// Project Name:  KGPRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlTester;

	// Inputs
	reg [7:0] OpCode;

	// Outputs
	wire Branch;
	wire [7:0] ALUop;
	wire ALUsrc;
	wire BLop;
	wire MemWrite;
	wire MemToReg;
	wire RegWrite;

	// Instantiate the Unit Under Test (UUT)
	Control uut (
		.OpCode(OpCode), 
		.Branch(Branch), 
		.ALUop(ALUop), 
		.ALUsrc(ALUsrc), 
		.BLop(BLop), 
		.MemWrite(MemWrite), 
		.MemToReg(MemToReg), 
		.RegWrite(RegWrite)
	);

	initial begin
		// Initialize Inputs
		OpCode = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 OpCode = 8'b00000001;
		#10 OpCode = 8'b00000010;
		#10 OpCode = 8'b00000011;
		#10 OpCode = 8'b00000100;
		#10 OpCode = 8'b00000101;
		#10 OpCode = 8'b00000110;
		#10 OpCode = 8'b00100000;
		#10 OpCode = 8'b00100001;
		#10 OpCode = 8'b00100010;
		#10 OpCode = 8'b00100011;
		#10 OpCode = 8'b00100100;
		#10 OpCode = 8'b01000000;
		#10 OpCode = 8'b01000001;
		#10 OpCode = 8'b01100000;
		#10 OpCode = 8'b01100001;
		#10 OpCode = 8'b01100010;
		#10 OpCode = 8'b01100011;
		#10 OpCode = 8'b10000000;
		#10 OpCode = 8'b10000001;
		#10 OpCode = 8'b10000010;
		#10 OpCode = 8'b10100000;
		$finish;
		
	end
      
	initial begin
		$monitor("OpCode = %b, Branch = %b, ALUop = %b, ALUsrc = %b, BLop = %b, MemWrite = %b, MemToReg = %b, RegWrite = %b\n",OpCode, Branch, ALUop, ALUsrc, BLop, MemWrite, MemToReg, RegWrite);
		
	end
		
endmodule

