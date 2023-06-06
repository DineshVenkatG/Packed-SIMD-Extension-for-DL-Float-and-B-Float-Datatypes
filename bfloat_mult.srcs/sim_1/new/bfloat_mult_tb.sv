`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2023 01:06:48
// Design Name: 
// Module Name: bfloat_mult_tb
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


module bfloat_mult_tb();

reg [15:0]a,b;
wire [15:0]c;

bfloat_mult DUT(a,b,c);
initial begin
a=16'b0100001000011000;
b=16'b0100000101010000;

#20
a=16'b1100001000011000;
b=16'b0100000101010000;

#20
a=16'b0100001000011000;
b=16'b1100000101010000;

#20
a=16'b1100001000011000;
b=16'b1100000101010000;

#250 $finish;
end


endmodule
