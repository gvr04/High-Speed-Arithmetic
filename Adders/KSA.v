`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 07:50:39
// Design Name: 
// Module Name: KSA
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
module pgen(
 input p,g,po,go,
 output reg P,G
);
always@* begin
 P=p&po;
 G=g|(p&go);
end
endmodule
module KSA
#(N=16)
(
      input [N-1:0] A,B,
      input cin,
      output cout,
      output reg [N-1:0] sum
    );
integer j;
wire [N-1:0]G1,P1,G2,P2,G3,P3,G4,P4;
reg[N-1:0]C,G0,P0;
always@* 
begin
for (j=0;j<N;j=j+1) begin
P0[j]=A[j]^B[j];
if (j==0)
 G0[j]=(A[j]&B[j])|(A[j]&cin)|(B[j]&cin);
else
 G0[j]=A[j]&B[j]; 

end
end
assign{P1[0],G1[0]}={P0[0],G0[0]};
assign{P2[0],G2[0]}={P1[0],G1[0]};
assign{P3[0],G3[0]}={P2[0],G2[0]};
assign{P4[0],G4[0]}={P3[0],G3[0]};
assign{P2[1],G2[1]}={P1[1],G1[1]};
assign{P3[1],G3[1]}={P2[1],G2[1]};
assign{P4[1],G4[1]}={P3[1],G3[1]};
assign{P3[2],G3[2]}={P2[2],G2[2]};
assign{P4[2],G4[2]}={P3[2],G3[2]};
assign{P3[3],G3[3]}={P2[3],G2[3]};
assign{P4[3],G4[3]}={P3[3],G3[3]};
assign{P4[4],G4[4]}={P3[4],G3[4]};
assign{P4[5],G4[5]}={P3[5],G3[5]};
assign{P4[6],G4[6]}={P3[6],G3[6]};
assign{P4[7],G4[7]}={P3[7],G3[7]};
genvar i;
generate
 for(i=1;i<N;i=i+1) begin: lvl1
   pgen md1(.p(P0[i]),.g(G0[i]),.po(P0[i-1]),.go(G0[i-1]),.P(P1[i]),.G(G1[i]));  
 end
 endgenerate  
 genvar k,l,m;
generate
 for(k=2;k<N;k=k+1) begin: lvl2
   pgen md2(.p(P1[k]),.g(G1[k]),.po(P1[k-2]),.go(G1[k-2]),.P(P2[k]),.G(G2[k]));  
 end
 endgenerate 
 generate
 for(l=4;l<N;l=l+1) begin: lvl3
   pgen md3(.p(P2[l]),.g(G2[l]),.po(P2[l-4]),.go(G2[l-4]),.P(P3[l]),.G(G3[l]));  
 end
 endgenerate 
 generate
 for(m=8;m<N;m=m+1) begin: lvl4
   pgen md4(.p(P3[m]),.g(G3[m]),.po(P3[m-8]),.go(G3[m-8]),.P(P4[m]),.G(G4[m]));  
 end
 endgenerate 
 
 integer n;
 always@* begin
 for(n=0;n<N;n=n+1)begin
 if (n==0)begin
 C[n]=(P4[n]&cin)|G4[n];
 sum[n]=P0[n]^cin;end
 else begin
 C[n]=(P4[n]&C[n-1])|G4[n];
 sum[n]=P0[n]^C[n-1];
 end end
 end
  
 assign cout=C[N-1];
endmodule
