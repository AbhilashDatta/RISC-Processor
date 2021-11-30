`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:05:55 11/06/2021
// Design Name:   Shift_32_bit
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/Shift_32_bit_test.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shift_32_bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Shift_32_bit_test;

	// Inputs
	reg [31:0] in;
	reg [31:0] shiftAmt;
	reg LeftOrRight;
	reg isArith;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shift_32_bit uut (
		.out(out), 
		.in(in), 
		.shiftAmt(shiftAmt), 
		.LeftOrRight(LeftOrRight), 
		.isArith(isArith)
	);

	initial begin
		// Initialize Inputs
		in = 0;
		shiftAmt = 0;
		LeftOrRight = 0;
		isArith = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 1; LeftOrRight = 1; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 2; LeftOrRight = 1; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 3; LeftOrRight = 1; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 4; LeftOrRight = 1; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 5; LeftOrRight = 1; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 6; LeftOrRight = 1; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 1256; LeftOrRight = 1; isArith = 0;
		
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 1; LeftOrRight = 0; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 2; LeftOrRight = 0; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 3; LeftOrRight = 0; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 4; LeftOrRight = 0; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 5; LeftOrRight = 0; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 6; LeftOrRight = 0; isArith = 0;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 1256; LeftOrRight = 0; isArith = 0;
		
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 1; LeftOrRight = 0; isArith = 1;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 2; LeftOrRight = 0; isArith = 1;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 3; LeftOrRight = 0; isArith = 1;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 4; LeftOrRight = 0; isArith = 1;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 5; LeftOrRight = 0; isArith = 1;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 6; LeftOrRight = 0; isArith = 1;
		#10 in = 32'b11100010011001000001001000110011; shiftAmt = 1256; LeftOrRight = 0; isArith = 1;
		#10 $finish;
		// Add stimulus here

	end
	
	initial begin
		$monitor("Input = %b, Shift amount = %0d, Output = %b, LeftOrRight = %b, isArith = %b", in, shiftAmt, out, LeftOrRight, isArith);
	end
      
endmodule

