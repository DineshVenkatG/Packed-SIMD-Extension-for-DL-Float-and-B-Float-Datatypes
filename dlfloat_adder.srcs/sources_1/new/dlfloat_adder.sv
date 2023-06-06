`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2023 13:15:27
// Design Name: 
// Module Name: dlfloat_adder
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

module dlfloat_adder(a,b,c);
input logic [15:0]a,b;
output logic [15:0]c;

logic [15:0]a1,b1,temp;
logic [5:0]ea,eb,e,bias; //bias dimension
logic [8:0]ma,mb,m_f;
logic [13:0] ma_temp,mb_temp,m_add,m_temp;//check
logic [10:0]m1;
logic g,r,s0,s1,s,p,s3;

always_comb
begin
   a1=a;
   b1=b;
   
    if(a1[14:9]<b1[14:9])
      begin
        temp=a1;
        a1=b1;
        b1=temp;
      end
      
ea=a1[14:9];
eb=b1[14:9];

ma=a1[8:0];
mb=b1[8:0];
    
bias=ea-eb;
s3=a[15];

ma_temp[13]=0;
mb_temp[13]=0;
ma_temp[12]=1;
mb_temp[12]=1;
ma_temp[11:3]=ma;
mb_temp[11:3]=mb;
ma_temp[2:0]=0;
mb_temp[2:0]=0;

mb_temp=mb_temp>>bias;

m_add=ma_temp+mb_temp;

e=m_add[13]?(ea+1):ea;
m_temp[11:0]=m_add[13]?m_add[12:1]:m_add[11:0];
m_temp[12]=1;
m_temp[13]=0;

//rounding off
g=m_temp[3];
r=m_temp[2];
s0=m_temp[0];
s1=m_temp[1];
s=s0|s1;
    
p=r&(((~g)&s)|g);

if(p)
    m1=m_temp[13:3]+1;
else
    m1=m_temp[13:3];



m_f=m1[10]?(m1[9:1]):m1[8:0];
e=m1[10]?(e+1):e;

end

    
    assign c[15]=s3;
    assign c[8:0]=m_f;
    assign c[14:9]=e;





endmodule

