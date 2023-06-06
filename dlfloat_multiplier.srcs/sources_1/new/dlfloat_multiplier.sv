`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 15:09:52
// Design Name: 
// Module Name: dlfloat_multiplier
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


module dlfloat_multiplier(a,b,c);
//parameter m=9;
//parameter e=6;
//parameter p=16;

input logic [15:0]a,b;
wire  [8:0]man_out;
wire  [5:0]exp_out;
wire  s_out;
output logic  [15:0]c;

wire [5:0]Ea,Eb;
wire [8:0]Ma,Mb;
wire [9:0]temp_Ma,temp_Mb;
wire [19:0] temp_prod;
wire msb,Carry1,Carry2,Sa,Sb;
wire [15:0]Sum1,Sum2;

wire [5:0]sum,diff,sum1;
wire cout,cout1,cout2;

assign Sa=a[15];
assign Sb=b[15];
assign Ea=a[14:9];
assign Eb=b[15:9];
assign Ma=a[8:0];
assign Mb=b[8:0];

assign temp_Ma[9:0]={1'b1,Ma[8:0]};
assign temp_Mb[9:0]={1'b1,Mb[8:0]};

xor g1 (s_out,Sa,Sb);

assign temp_prod=temp_Ma * temp_Mb;

assign msb=temp_prod[19];


assign Sum1=temp_prod[17:9]+temp_prod[8];
assign Sum2=temp_prod[18:10]+temp_prod[9];
assign man_out[8:0]= (msb)? Sum2[8:0] : Sum1[8:0];

assign sum=Ea+Eb;
assign diff=sum-6'b011111;
assign sum1=diff+1'b1;
assign exp_out[5:0]=(msb==0) ? diff[5:0] : sum1[5:0];

assign c[15:0]=(a[15:0]==0 || b[15:0]==0) ? 16'b0000_0000_0000_0000 : {s_out,exp_out[5:0],man_out[8:0]};


endmodule
