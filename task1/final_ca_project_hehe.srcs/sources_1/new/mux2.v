`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 19:49:26
// Design Name: 
// Module Name: mux2
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

module mux2( 

input [63:0] a, 

input [63:0] b, 

input sel, 

output reg [63:0] data_out 

); 

  

always @ (sel) begin 

    if (sel == 1) begin 

        assign data_out = a; 

        end 

    else begin 

        assign data_out = b; 

        end 

    end 

     
endmodule