`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:02:44 11/09/2021 
// Design Name: 
// Module Name:    ALU 
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
module ALU(zero, Result, Input1, Input2, isTwoC, Operation, SetFlag, LeftOrRight, isArith);

output[31:0] Result;
output zero;

input[31:0] Input1, Input2;
input[1:0] Operation;
input[2:0] SetFlag;
input LeftOrRight, isArith, isTwoC;

wire[31:0] fOut, fOut1;
wire[31:0] adderInput, adderInput1;
wire[31:0] adderOut, andOut, orOut, shiftOut;
wire sumCarry;

assign fOut1 = 32'b0;

Flip fl32(.out(fOut), .in(Input2));
Mux mx1(.out(adderInput), .a(fOut), .b(Input2), .sel(isTwoC));
Mux mx2(.out(adderInput1), .a(fOut1), .b(Input1), .sel(isTwoC));
Adder_32_Bit addr(.sum(adderOut), .carry(sumCarry), .input1(adderInput1), .input2(adderInput), .carryIn(isTwoC));

AND_32_bit and32(.out(andOut), .in1(Input1), .in2(Input2));

OR_32_bit or32(.out(orOut), .in1(Input1), .in2(Input2));

Shift_32_bit shift32(.out(shiftOut), .in(Input1), .shiftAmt(Input2), .LeftOrRight(LeftOrRight), .isArith(isArith));

Multiplexer_4_input mux2(.out(Result), .sumOut(adderOut), .andOut(andOut), .orOut(orOut), .shiftOut(shiftOut), .sel(Operation));
Flag fl(.sum(adderOut), .setflag(SetFlag), .carry(sumCarry), .flag(zero));

endmodule
