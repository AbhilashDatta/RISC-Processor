`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   05:14:36 11/09/2021
// Design Name:   InstructionMemory
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/InsMemoryTest.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InsMemoryTest;

	// Inputs
	reg [11:0] Address;
	reg Clk;
	reg Ena;
	reg [3:0] Wea;
	reg [31:0] InsInput;

	// Outputs
	wire [31:0] Instruction;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.Instruction(Instruction), 
		.Address(Address), 
		.Clk(Clk), 
		.Ena(Ena), 
		.Wea(Wea), 
		.InsInput(InsInput)
	);

	
	always #10 Clk = ~Clk;
	
	initial begin
		// Initialize Inputs
		Address <= 0;
		Ena <= 0;
		Wea <= 0;
		InsInput <= 0;
		Clk <= 0;

		// Wait 100 ns for global reset to finish
		#30; Ena<=1; Address <= 0;
		#30; Ena<=1; Address <= 1;
		#30; Ena<=1; Address <= 2;
		#30; Ena<=1; Address <= 3;
		#30; Ena<=1; Address <= 4;
		#30; Ena<=1; Address <= 5;
		#30; Ena<=1; Address <= 6;
		#30; Ena<=1; Address <= 7;
		#30 $finish;
		// Add stimulus here
	end
	
	initial begin
		$monitor("Instruction = %b, Address = %b", Instruction, Address);
	end
      
endmodule

