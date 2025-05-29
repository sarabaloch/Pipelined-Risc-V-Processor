`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.04.2024 11:45:09
// Design Name: 
// Module Name: MEM_WRB
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


module MEM_WRB(
    input clk, reset,
    input MemtoReg, RegWrite,
    input [4:0] RD,
    input [63:0] EM_Result, Read_Data,
    output reg MW_MemtoReg, MW_RegWrite,
    output reg [4:0] MW_RD, 
    output reg [63:0] MW_Result, MW_Read_Data
    );
always @(posedge clk or posedge reset) begin
    if (reset == 1'b1) begin
        MW_MemtoReg = 0; MW_RegWrite = 0; MW_RD = 0;
        MW_Result = 0; MW_Read_Data = 0;
    end
    else begin
        MW_MemtoReg = MemtoReg; MW_RegWrite = RegWrite; MW_RD = RD;
        MW_Result = EM_Result; MW_Read_Data = Read_Data;
    end 
end
endmodule
