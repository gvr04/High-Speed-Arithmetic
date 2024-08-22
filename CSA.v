`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 17:52:19
// Design Name: 
// Module Name: CSA
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


module CSA(
     input [15:0]A,B,
     input cin,
     output[15:0]sum,
     output cout
    );
reg [15:0]P;
wire [15:0] C;
wire co1,co2;
integer i;
always@* begin
 for(i=0;i<16;i=i+1)
  P[i]=A[i]^B[i];
 end
//Block 1

fadd md0(.a(A[0]),.b(B[0]),.cin(cin),.cout(C[0]),.sum(sum[0]));
fadd md1(.a(A[1]),.b(B[1]),.cin(C[0]),.cout(C[1]),.sum(sum[1]));
fadd md2(.a(A[2]),.b(B[2]),.cin(C[1]),.cout(C[2]),.sum(sum[2]));
fadd md3(.a(A[3]),.b(B[3]),.cin(C[2]),.cout(C[3]),.sum(sum[3]));
assign co1=(&P[3:0])?cin:C[3];
//Block2
fadd md4(.a(A[4]),.b(B[4]),.cin(co1),.cout(C[4]),.sum(sum[4]));
fadd md5(.a(A[5]),.b(B[5]),.cin(C[4]),.cout(C[5]),.sum(sum[5]));
fadd md6(.a(A[6]),.b(B[6]),.cin(C[5]),.cout(C[6]),.sum(sum[6]));
fadd md7(.a(A[7]),.b(B[7]),.cin(C[6]),.cout(C[7]),.sum(sum[7]));
fadd md8(.a(A[8]),.b(B[8]),.cin(C[7]),.cout(C[8]),.sum(sum[8]));
fadd md9(.a(A[9]),.b(B[9]),.cin(C[8]),.cout(C[9]),.sum(sum[9]));
fadd md10(.a(A[10]),.b(B[10]),.cin(C[9]),.cout(C[10]),.sum(sum[10]));
fadd md11(.a(A[11]),.b(B[11]),.cin(C[10]),.cout(C[11]),.sum(sum[11]));
assign co2=(&P[11:4])?co1:C[11];

//Block3   
fadd md12(.a(A[12]),.b(B[12]),.cin(co2),.cout(C[12]),.sum(sum[12]));
fadd md13(.a(A[13]),.b(B[13]),.cin(C[12]),.cout(C[13]),.sum(sum[13]));
fadd md14(.a(A[14]),.b(B[14]),.cin(C[13]),.cout(C[14]),.sum(sum[14]));
fadd md15(.a(A[15]),.b(B[15]),.cin(C[14]),.cout(C[15]),.sum(sum[15])); 
assign cout=(&P[15:12])?co2:C[15];  
endmodule
