`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:54:36 11/10/2021
// Design Name:   Instruction_decoder
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/DecoderTest.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Instruction_decoder
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DecoderTest;

	// Inputs
	reg [31:0] inp;
	reg [31:0] rsVal;

	// Outputs
	wire [7:0] opcode;
	wire [4:0] reg1;
	wire [4:0] reg2;
	wire [31:0] label;
	wire [15:0] immediate;

	// Instantiate the Unit Under Test (UUT)
	Instruction_decoder uut (
		.opcode(opcode), 
		.reg1(reg1), 
		.reg2(reg2), 
		.label(label), 
		.immediate(immediate), 
		.inp(inp), 
		.rsVal(rsVal)
	);

	initial begin
		// Initialize Inputs
		inp <= 0;
		rsVal <= 0;

		// Wait 100 ns for global reset to finish
		#100;
      
		#10 inp <= 32'b00000101001000110000000000000000; rsVal <= 32'b0;
		// Add stimulus here
		#10 $finish;
	end
	
	initial begin
		$monitor("Opcode = %b, Reg1 = %b, Reg2 = %b, Immediate value = %b, Label = %b, input = %b", opcode, reg1, reg2, immediate, label, inp);
	end
	
endmodule

