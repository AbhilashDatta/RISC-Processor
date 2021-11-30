`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:50:55 11/09/2021
// Design Name:   DataMemory
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/DataMemoryTest.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemoryTest;

	// Inputs
	wire [31:0] DataOut;
	reg [31:0] DataIn;
	reg [11:0] Address;
	reg Clk;
	reg Ena;
	reg Wea;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.DataOut(DataOut), 
		.DataIn(DataIn), 
		.Address(Address), 
		.Clk(Clk), 
		.Ena(Ena), 
		.Wea(Wea)
	);
	
	always #10 Clk=~Clk;



initial begin
	// Initialize Inputs
	DataIn <= 0;
	Address <= 0;
	Clk <= 0;
	Ena <= 0;
	Wea <= 0;

	#100
	DataIn <= 32'b0000000000000000000101010111101; Address <= 12'b0; Ena <= 1; Wea <= 1;
	#30 Wea <= 0;
	Address <= 12'b0; Ena <= 1; Wea <= 0;
	#400
	// Add stimulus here
	#200 $finish;

end
	
	initial begin
		$monitor("DataOut = %b, Clk = %b, Time = %0d", DataOut, Clk, $time);
	end
      
endmodule

