`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 03:12:33 PM
// Design Name: 
// Module Name: top_module_11
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


module TOP( 
input clk, 
input reset, 

output wire [63:0] PC_Out, 
output wire [31:0] instruction, 
output wire [4:0] rs1, 
output wire [4:0] rs2, 
output wire [4:0] rd, 
output wire [63:0] WriteData, 
output wire [63:0] readData1, 
output wire [63:0] readData2, 
output wire [63:0] imm_data,
output wire [63:0] data_out, 
output wire [63:0] Result, 
output wire ZERO, 
output wire [63:0] Read_Data,
output wire [63:0] out1,
output wire [6:0] opcode,
output wire [2:0] funct3,
output wire [6:0] funct7,
output wire [1:0] ALUOp, 
output wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite,
output wire [3:0] Operation,
output wire [63:0] out2,
output wire [63:0] PC_In,
output wire [63:0] first,
output wire [63:0] second,
output wire [63:0] third,
output wire [63:0] fourth,
output wire [63:0] fifth
); 

//add 4 to pc_out for next instruct, this will be used later, not right now
Adder add1 (PC_Out, 4, out1); //correct
//select between adder +4 instruction or branch ins 
mux3 PCs (out2, out1, Branch & ZERO, PC_In); 
//program counter goes to next address 
Program_Counter pc (clk,reset, PC_In, PC_Out); //correct

instruction_mem insmem (PC_Out, instruction); //correct
instructionParser inspar (instruction, opcode, rd, funct3, rs1, rs2, funct7); //correct
imm_data immgen (instruction, imm_data); //correct
Control_Unit conunit (opcode, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite); //correct
register_file regf (WriteData, rs1, rs2, rd, Regwrite, reset, clk, readData1, readData2); //the write data is coming from mux used later, correct
//branch adder instantiation to add branch and prev instruction address. 
//wire [63:0] b = imm_data << 1; // doing shift left 
Adder add2 (PC_Out,imm_data,out2); //error???
mux1 ALUs (imm_data, readData2, ALUSrc, data_out); //correct
ALU_Control ALUcont (ALUOp, {instruction[30], funct3}, Operation); //correct

ALU_64_bit ALU (readData1, data_out, Operation, Result); //correct
beq_bge br(funct3, readData1, readData2, ZERO);
data_mem datamem (Result, readData2, clk, MemWrite, MemRead, Read_Data, first, second, third, fourth, fifth); //correct
//verified from data mem values we had stored earlier

//select between alu result or read data
mux2 memreg (Read_Data, Result, MemtoReg, WriteData); //this write data goes back to register file

//note, our mux chooses first one when signal is 1 else it chooses second one so all our parameters are the opposite for mux

endmodule 