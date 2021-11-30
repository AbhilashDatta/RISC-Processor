`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:13:19 11/11/2021
// Design Name:   KGP_RISC
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/RISC_KGP_Test.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: KGP_RISC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RISC_KGP_Test;

	// Inputs
	reg Clk;
	reg Reset;
	reg Ena;

	// Outputs
	wire [31:0] PCValue;
	wire [31:0] Result;

	// Instantiate the Unit Under Test (UUT)
	KGP_RISC uut (
		.PCValue(PCValue), 
		.Result(Result), 
		.Clk(Clk), 
		.Reset(Reset), 
		.Ena(Ena)
	);
	
	always #10 Clk=~Clk;

	initial begin
		// Initialize Inputs
		Clk <= 0;
		Reset <= 0;
		Ena <= 0;

		// Wait 100 ns for global reset to finish
      #20 Reset <= 1; Ena <= 1;
		#20 Reset <= 0;
		#1200;
		#40 $finish;
		// Add stimulus here

	end
	
	initial begin
		$monitor("PC Value = %b, time = %d", PCValue, $time);
	end
      
endmodule

