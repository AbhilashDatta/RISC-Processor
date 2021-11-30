`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:16:09 11/09/2021 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(DataOut, DataIn, Address, Clk, Ena, Wea);
output[31:0] DataOut;
input[31:0] DataIn;
input[11:0] Address;
input Clk, Ena, Wea;

Data_BRAM dMem(
  .clka(Clk),
  .ena(Ena),
  .wea(Wea),
  .addra(Address),
  .dina(DataIn),
  .douta(DataOut)
);

endmodule
