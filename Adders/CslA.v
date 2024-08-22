`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 14:29:01
// Design Name: 
// Module Name: CslA
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


module CslA(
     input [15:0] A,B,
     input cin,
     output [15:0]Sum,
     output cout
    );
wire [15:0] s0,s1,C0,C1; 
wire[1:0]C;
wire[2:0]mux_sl;   
fadd md0(.a(A[0]),.b(B[0]),.cin(cin),.sum(Sum[0]),.cout(C[0]));
fadd md1(.a(A[1]),.b(B[1]),.cin(C[0]),.sum(Sum[1]),.cout(C[1]));
//Block 2

fadd md20(.a(A[2]),.b(B[2]),.cin(1'b0),.sum(s0[2]),.cout(C0[2]));
fadd md30(.a(A[3]),.b(B[3]),.cin(C0[2]),.sum(s0[3]),.cout(C0[3]));

fadd md21(.a(A[2]),.b(B[2]),.cin(1'b1),.sum(s1[2]),.cout(C1[2]));
fadd md31(.a(A[3]),.b(B[3]),.cin(C1[2]),.sum(s1[3]),.cout(C1[3]));

assign Sum[3:2]=C[1]?s1[3:2]:s0[3:2];
assign mux_sl[0]=C[1]?C1[3]:C0[3];
//Block 3

fadd md40(.a(A[4]),.b(B[4]),.cin(1'b0),.sum(s0[4]),.cout(C0[4]));
fadd md50(.a(A[5]),.b(B[5]),.cin(C0[4]),.sum(s0[5]),.cout(C0[5]));
fadd md60(.a(A[6]),.b(B[6]),.cin(C0[5]),.sum(s0[6]),.cout(C0[6]));

fadd md41(.a(A[4]),.b(B[4]),.cin(1'b1),.sum(s1[4]),.cout(C1[4]));
fadd md51(.a(A[5]),.b(B[5]),.cin(C1[4]),.sum(s1[5]),.cout(C1[5]));
fadd md61(.a(A[6]),.b(B[6]),.cin(C1[5]),.sum(s1[6]),.cout(C1[6]));

assign Sum[6:4]=mux_sl[0]?s1[6:4]:s0[6:4];
assign mux_sl[1]=mux_sl[0]?C1[6]:C0[6];
//Block 4

fadd md70(.a(A[7]),.b(B[7]),.cin(1'b0),.sum(s0[7]),.cout(C0[7]));
fadd md80(.a(A[8]),.b(B[8]),.cin(C0[7]),.sum(s0[8]),.cout(C0[8]));
fadd md90(.a(A[9]),.b(B[9]),.cin(C0[8]),.sum(s0[9]),.cout(C0[9]));
fadd md100(.a(A[10]),.b(B[10]),.cin(C0[9]),.sum(s0[10]),.cout(C0[10]));

fadd md71(.a(A[7]),.b(B[7]),.cin(1'b1),.sum(s1[7]),.cout(C1[7]));
fadd md81(.a(A[8]),.b(B[8]),.cin(C1[7]),.sum(s1[8]),.cout(C1[8]));
fadd md91(.a(A[9]),.b(B[9]),.cin(C1[8]),.sum(s1[9]),.cout(C1[9]));
fadd md101(.a(A[10]),.b(B[10]),.cin(C1[9]),.sum(s1[10]),.cout(C1[10]));

assign Sum[10:7]=mux_sl[1]?s1[10:7]:s0[10:7];
assign mux_sl[2]=mux_sl[1]?C1[10]:C0[10];
//Block 5

fadd md110(.a(A[11]),.b(B[11]),.cin(1'b0),.sum(s0[11]),.cout(C0[11]));
fadd md120(.a(A[12]),.b(B[12]),.cin(C0[11]),.sum(s0[12]),.cout(C0[12]));
fadd md130(.a(A[13]),.b(B[13]),.cin(C0[12]),.sum(s0[13]),.cout(C0[13]));
fadd md140(.a(A[14]),.b(B[14]),.cin(C0[13]),.sum(s0[14]),.cout(C0[14]));
fadd md150(.a(A[15]),.b(B[15]),.cin(C0[14]),.sum(s0[15]),.cout(C0[15]));

fadd md111(.a(A[11]),.b(B[11]),.cin(1'b1),.sum(s1[11]),.cout(C1[11]));
fadd md121(.a(A[12]),.b(B[12]),.cin(C1[11]),.sum(s1[12]),.cout(C1[12]));
fadd md131(.a(A[13]),.b(B[13]),.cin(C1[12]),.sum(s1[13]),.cout(C1[13]));
fadd md141(.a(A[14]),.b(B[14]),.cin(C1[13]),.sum(s1[14]),.cout(C1[14]));
fadd md151(.a(A[15]),.b(B[15]),.cin(C1[14]),.sum(s1[15]),.cout(C1[15]));

assign Sum[15:11]=mux_sl[2]?s1[15:11]:s0[15:11];
assign cout=mux_sl[2]?C1[15]:C0[15];

    
endmodule
