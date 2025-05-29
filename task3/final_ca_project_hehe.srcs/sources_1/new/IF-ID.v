`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2024 11:40:46
// Design Name: 
// Module Name: IF-ID
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


module IF_ID(
    input clk,
    input stall,
    input [63:0] PC_Out,
    input [31:0] Instruction,
    output reg [63:0] IFID_PC_Out,
    output reg [31:0] IFID_Instruction
    );
always @ (posedge clk) begin
 if (stall == 1'b1) begin
        IFID_PC_Out = IFID_PC_Out; IFID_Instruction = IFID_Instruction;
    end
    else
        IFID_Instruction = Instruction; 
        IFID_PC_Out = PC_Out;
    end
endmodule