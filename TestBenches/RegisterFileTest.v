`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:19:33 11/10/2021
// Design Name:   RegisterFile
// Module Name:   /home/rrohit2901/Desktop/Xilinx_ISE_DS_Lin_14.7_1015_1/RISC_KGP/RegisterFileTest.v
// Project Name:  RISC_KGP
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterFileTest;

	// Inputs
	reg [4:0] reg1;
	reg [4:0] reg2;
	reg [31:0] writeData;
	reg RegWrite;
	reg Clk;
	reg Reset;

	// Outputs
	wire [31:0] ReadData1;
	wire [31:0] ReadData2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.ReadData1(ReadData1), 
		.ReadData2(ReadData2), 
		.reg1(reg1), 
		.reg2(reg2), 
		.writeData(writeData), 
		.RegWrite(RegWrite), 
		.Clk(Clk), 
		.Reset(Reset)
	);
	
	always #10 Clk=~Clk;

	initial begin
		// Initialize Inputs
		reg1 <= 0;
		reg2 <= 0;
		writeData <= 0;
		RegWrite <= 0;
		Clk <= 0;
		Reset <= 0;

		// Wait 100 ns for global reset to finish
		#100;
		#20 reg1 <= 15; RegWrite <= 1; writeData <= 32'b1100001110001;
		#20 reg1 <= 16; RegWrite <= 1; writeData <= 32'b1001001001001;
		#20 reg1 <= 15; reg2 <= 16; RegWrite = 0;
		#20 $finish;
		// Add stimulus here

	end
	
	initial begin
		$monitor("ReadData1 = %b, ReadData2 = %b", ReadData1, ReadData2);
	end
      
endmodule

