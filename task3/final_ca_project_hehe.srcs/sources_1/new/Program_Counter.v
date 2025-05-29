`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 02:05:20 PM
// Design Name: 
// Module Name: Program_Counter
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


module Program_Counter(
input clk,
input reset,
input stall,
input [63:0] PC_In,
output reg [63:0] PC_Out
);

initial 
PC_Out = 0; //only runs once at the start


always @ (posedge clk || reset) begin // runs if either clock or reset CHANGES (not =1 necessarily)
if (reset == 1) begin
PC_Out = 0;
end
else if (stall == 1'b1) PC_Out = PC_Out;
else begin
PC_Out = PC_In;
end
end

endmodule
