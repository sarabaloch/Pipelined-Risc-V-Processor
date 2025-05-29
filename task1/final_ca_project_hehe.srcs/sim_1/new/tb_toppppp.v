`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.04.2024 15:56:44
// Design Name: 
// Module Name: tb_toppppp
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

module tb_toppppp();

reg clk; 
reg reset; 
wire [63:0] PC_Out; // Instr Addr
wire [31:0] Instruction; 
wire [4:0] rs1; 
wire [4:0] rs2; 
wire [4:0] rd; 
wire [63:0]WriteData; 
wire [63:0]ReadData1; 
wire [63:0]ReadData2; 
wire [63:0]imm_data; 
wire [63:0] dataout; 
wire [63:0] Result; // Mem Addr 
wire ZERO; 
wire [63:0] Read_Data; 
wire [63:0] out1;
wire [6:0] opcode;
wire [2:0] funct3;
wire [6:0] funct7;
wire [1:0] ALUOp;
wire Branch; 
wire MemRead;
wire MemtoReg;
wire MemWrite;
wire ALUSrc;
wire Regwrite;
wire [3:0] Operation;  
wire [63:0] out2; 
wire [63:0] PC_In;
wire [63:0] first;
wire [63:0] second;
wire [63:0] third;
wire [63:0] fourth;
wire [63:0] fifth;
TOP P(clk, reset, PC_Out, Instruction,rs1,rs2,rd, WriteData, ReadData1, ReadData2, imm_data, dataout, Result, ZERO, Read_Data, out1, opcode, funct3, funct7, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, Operation, out2, PC_In, first, second, third, fourth, fifth);

initial 
begin 
clk = 0; 
reset = 0; 

# 5
reset = 0; 
end 

always #5 
clk = ~clk; 

endmodule
