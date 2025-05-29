`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 02:25:38 PM
// Design Name: 
// Module Name: mux
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

module mux1( 

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
