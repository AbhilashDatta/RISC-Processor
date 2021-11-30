`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:06:41 11/09/2021 
// Design Name: 
// Module Name:    InstructionMemory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module InstructionMemory(Instruction, Address, Clk, Ena, Wea, InsInput);

output[31:0] Instruction;
input[31:0] InsInput;
input[11:0] Address;
input Clk, Ena;
input[3:0] Wea;

BRAM iRAM(
  .clka(Clk),
  .ena(Ena),
  .wea(Wea),
  .addra(Address),
  .dina(InsInput),
  .douta(Instruction)
);

endmodule
