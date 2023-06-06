`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 13:21:08
// Design Name: 
// Module Name: dlfloat_adder_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module dlfloat_adder_tb();

reg [15:0]a,b;
wire [15:0]c;

dlfloat_adder DUT(a,b,c);
initial begin
a=16'b0100001000011000;
b=16'b0100000101010000;

#20
a=16'b1100001000011000;
b=16'b0100000101010000;

#250 $finish;
end
endmodule

