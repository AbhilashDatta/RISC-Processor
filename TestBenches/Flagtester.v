`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:31:23 11/06/2021
// Design Name:   Flag
// Module Name:   /home/abhilash/Desktop/Verilog_files/KGPRISC/Flagtester.v
// Project Name:  KGPRISC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Flag
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Flagtester;

	// Inputs
	reg signed [31:0] sum;
	reg [2:0] setflag;
	reg carry;

	// Outputs
	wire flag;

	// Instantiate the Unit Under Test (UUT)
	Flag uut (
		.sum(sum), 
		.setflag(setflag), 
		.carry(carry), 
		.flag(flag)
	);

	initial begin
		// Initialize Inputs
		sum = 0;
		setflag = 0;
		carry = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#10 sum = 0; carry = 0; setflag = 3'b001;
		#10 sum = -1; carry = 0; setflag = 3'b010;
		#10 sum = 1; carry = 0; setflag = 3'b010;
		#10 sum = 0; carry = 0; setflag = 3'b011;
		#10 sum = 1; carry = 0; setflag = 3'b011;
		#10 sum = 1; carry = 0; setflag = 3'b100;
		#10 sum = 0; carry = 0; setflag = 3'b100;
		#10 sum = 1; carry = 0; setflag = 3'b101;
		#10 sum = 0; carry = 1; setflag = 3'b101;
		#10 sum = 1; carry = 1; setflag = 3'b110;
		#10 sum = 0; carry = 0; setflag = 3'b110;
		#10 sum = 0; carry = 1; setflag = 3'b111;
		$finish;

	end
	
	initial begin
		$monitor("sum = %d, carry = %d, setflag = %b, flag = %d",sum, carry, setflag, flag);
	end
      
endmodule

