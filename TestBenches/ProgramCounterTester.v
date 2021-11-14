`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:10:41 11/08/2021
// Design Name:   ProgramCounter
// Module Name:   /home/abhilash/Desktop/Verilog_files/KGPRISC/ProgramCounterTester.v
// Project Name:  KGPRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ProgramCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ProgramCounterTester;

	// Inputs
	reg [31:0] Ip;
	reg Reset;
	reg Clk;

	// Outputs
	wire [31:0] State;

	// Instantiate the Unit Under Test (UUT)
	ProgramCounter uut (
		.State(State), 
		.Ip(Ip), 
		.Reset(Reset), 
		.Clk(Clk)
	);

	initial begin
		// Initialize Inputs
		Ip = 0;
		Reset = 0;
		Clk = 0;
	
		// Wait 100 ns for global reset to finish
		#100;
      
		// Add stimulus here
		#20 Ip = ~ Ip;
		#20;
		

	end

   always #10 Clk = ~Clk;  
	always #20 Reset = ~Reset;
	
	initial begin 
	$monitor("Ip = %b, Reset = %b, Clk = %b, State = %b",Ip, Reset, Clk, State);
	end
	
      
endmodule

