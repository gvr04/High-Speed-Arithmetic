`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.08.2024 12:23:32
// Design Name: 
// Module Name: Fadd
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


module fadd(
      input a,b,cin,
      output sum,cout
    );
assign sum=a^b^cin;
assign cout=(a&b)|(a&cin)|(b&cin);   
endmodule
