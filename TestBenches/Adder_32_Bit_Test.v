`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:49:20 11/09/2021
// Design Name:   Adder_32_Bit
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/Adder_32_Bit_Test.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Adder_32_Bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Adder_32_Bit_Test;

	// Inputs
	reg [31:0] input1;
	reg [31:0] input2;
	reg carryIn;

	// Outputs
	wire [31:0] sum;
	wire carry;

	// Instantiate the Unit Under Test (UUT)
	Adder_32_Bit uut (
		.sum(sum), 
		.carry(carry), 
		.input1(input1), 
		.input2(input2), 
		.carryIn(carryIn)
	);

	initial begin
		// Initialize Inputs
		input1 = 0;
		input2 = 0;
		carryIn = 0;

		// Wait 100 ns for global reset to finish
		#100;
		#10 input1 = 32'b00101010100001010101111011001101; input2 = 32'b10011010101001010101111011001101; carryIn = 0;
		#10 input1 = 32'b10101010100001010101111011001101; input2 = 32'b10011010101001010101111011001101; carryIn = 0;
		#10 input1 = 32'b00101010100001010101111011001101; input2 = 32'b00000000001001010101111011001000; carryIn = 1;
		#10 $finish;
		// Add stimulus here
	end
	
	initial begin
		$monitor("Input1 = %b, Input2 = %b, CarryIn = %b, Sum = %b, Carry = %b", input1, input2, carryIn, sum, carry);
	end
      
endmodule

