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
    wire [63:0] PC_Out; 
    wire [31:0] instruction; 
    wire [4:0] rs1;
    wire [4:0] rs2; 
    wire [4:0] rd;
    wire [63:0] WriteData;
    wire [63:0] readData1; 
    wire [63:0] readData2; 
    wire [63:0] imm_data;
    wire [63:0] data_out; 
    wire [63:0] Result;
    wire ZERO;
    wire [63:0] Read_Data;
    wire [63:0] out1;
    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [1:0] ALUOp;
    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite;
    wire [3:0] Operation;
    wire [63:0] out2;
    wire [63:0] PC_In;
    wire [63:0] first;
    wire [63:0] second;
    wire [63:0] third;
    wire [63:0] fourth;
    wire [63:0] fifth;
  
    wire [63:0] IFID_PC_Out;
    wire [31:0] IFID_Instruction;

    wire IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc;
    wire [1:0] IDEX_ALUOp;
    wire [3:0] IDEX_Funct;
    wire [4:0] IDEX_RS1, IDEX_RS2, IDEX_RD;
    wire [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm;
    wire EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite,
    EM_Adder2Out, EM_Result, EM_WriteData, EM_Zero;
    wire [4:0] EM_RD;
    wire MW_RD, MW_MemtoReg, MW_RegWrite, MW_Result, MW_Read_Data;
    
    TOP P(clk, reset, PC_Out, instruction,rs1,rs2,rd, WriteData, readData1, readData2, imm_data, data_out, Result, ZERO, Read_Data, out1, opcode, funct3, funct7, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite, Operation, out2, PC_In, first, second, third, fourth, fifth,IFID_PC_Out,
    IFID_Instruction, IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite,
    IDEX_ALUSrc,EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite, EM_Zero,MW_MemtoReg, MW_RegWrite, IDEX_ALUOp, IDEX_Funct, IDEX_RS1, IDEX_RS2, IDEX_RD, EM_RD, MW_RD, IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm, EM_Adder2Out, EM_Result, EM_WriteData, MW_Result, MW_Read_Data);

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
