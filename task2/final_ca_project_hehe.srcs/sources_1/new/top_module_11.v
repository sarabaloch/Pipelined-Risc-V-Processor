`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2023 08:06:57 PM
// Design Name: 
// Module Name: RISC_V_Pipelined
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
    output wire [63:0] fifth,
  
    output wire [63:0] IFID_PC_Out,
    output wire [31:0] IFID_Instruction,

    output wire IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite,
    IDEX_ALUSrc,EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite,
    EM_Zero,MW_MemtoReg, MW_RegWrite,
    output wire [1:0] IDEX_ALUOp,
    output  wire [3:0] IDEX_Funct,
    output wire [4:0] IDEX_RS1, IDEX_RS2, IDEX_RD, EM_RD, MW_RD,
    output wire [63:0] IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm,
    EM_Adder2Out, EM_Result, EM_WriteData, MW_Result, MW_Read_Data
    );



// --------------------------------------------------------------------- //
// Stage 1 - Instruction Fetch //
//mux1 muxfirst(.A(Adder1Out), .B(EM_Adder2Out), .S(sel_Branch), .Out(PC_In));

mux3 PCs (EM_Adder2Out, out1, Branch&ZERO, PC_In); 
//Program_Counter PC(.clk(clk), .reset(reset), .PC_In(PC_In), .PC_Out(PC_Out));
Program_Counter pc (clk,reset, PC_In, PC_Out);
//Adder add1(.A(PC_Out), .B(64'd4), .Out(Adder1Out));
Adder add1 (PC_Out, 64'd4, out1);
//instruction_mem IM(.Inst_Address(PC_Out), .Instruction(Instruction));
instruction_mem insmem (PC_Out, instruction);
IF_ID ifid(clk, PC_Out, instruction, IFID_PC_Out, IFID_Instruction);


// Stage 2 - Instruction Decode //
//Instruction_Parser IP(.Instruction(IFID_Instruction), .Opcode(Opcode), .RD(RD), .Funct3(Funct3), .RS1(RS1), .RS2(RS2), .Funct7(Funct7));
instructionParser inspar (IFID_Instruction, opcode, rd, funct3, rs1, rs2, funct7);
//Control_Unit CU(.Opcode(Opcode), .ALUOp(ALUOp), .Branch(Branch), .MemRead(MemRead), .MemtoReg(MemtoReg), .MemWrite(MemWrite), .ALUSrc(ALUSrc), .RegWrite(RegWrite));
Control_Unit conunit (opcode, ALUOp, Branch, MemRead, MemtoReg, MemWrite, ALUSrc, Regwrite);
//Imm_Gen IG(.Instruction(IFID_Instruction), .Imm(Imm));
imm_data immgen (IFID_Instruction, imm_data); 
//RegisterFile RF(.clk(clk), .reset(reset), .WriteData(WriteData), .RS1(RS1), .RS2(RS2), .RD(MW_RD), .RegWrite(MW_RegWrite), .ReadData1(ReadData1), .ReadData2(ReadData2));
register_file regf (WriteData, rs1, rs2, MW_RD, MW_RegWrite, reset, clk, readData1, readData2);
//assign Funct = {IFID_Instruction[30], IFID_Instruction[14:12]};
ID_EX idex(clk, reset, Branch, MemRead, MemWrite, MemtoReg, Regwrite, ALUSrc, ALUOp,
        {instruction[30], funct3}, rs1, rs2, rd, IFID_PC_Out, readData1, readData2, imm_data,
        IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite, IDEX_ALUSrc,
        IDEX_ALUOp, IDEX_Funct, IDEX_RS1, IDEX_RS2, IDEX_RD,
        IDEX_PC_Out, IDEX_ReadData1, IDEX_ReadData2, IDEX_Imm);
        
// Stage 3 - Execution // 
//Adder add2(.A(IDEX_PC_Out), .B(IDEX_Imm << 1), .Out(Adder2Out));
Adder add2 (IDEX_PC_Out,IDEX_Imm << 1,out2);
//Mux_2x1 muxmid(.A(IDEX_ReadData2), .B(IDEX_Imm), .S(IDEX_ALUSrc), .Out(MuxmidOut));
mux1 ALUs (IDEX_Imm, IDEX_ReadData2, IDEX_ALUSrc, data_out);
//ALU_Control AluC(.ALUOp(IDEX_ALUOp), .Funct(IDEX_Funct), .Operation(Operation));
ALU_Control ALUcont (IDEX_ALUOp, IDEX_Funct, Operation);
//ALU64bit ALU(.A(IDEX_ReadData1), .B(MuxmidOut), .ALUOp(Operation), .Result(Result), .Zero(Zero));
ALU_64_bit ALU (IDEX_ReadData1, data_out, Operation, Result);
beq_bge br(IDEX_Funct[2:0], IDEX_ReadData1, IDEX_ReadData2, ZERO);
EX_MEM EM(clk, reset, IDEX_Branch, IDEX_MemRead, IDEX_MemWrite, IDEX_MemtoReg, IDEX_RegWrite,
          ZERO, IDEX_RD, out2, Result, WriteData, 
          EM_Branch, EM_MemRead, EM_MemWrite, EM_MemtoReg, EM_RegWrite, EM_Zero, EM_RD, EM_Adder2Out, EM_Result, EM_WriteData);

// Stage 4 - Memory Access // 
assign select = EM_Branch && EM_Zero;

//Data_Memory DM(.clk(clk), .MemWrite(EM_MemWrite), .MemRead(EM_MemRead), .Mem_Addr(EM_Result), .Write_Data(EM_WriteData), .Read_Data(Read_Data));
data_mem datamem (EM_Result, EM_WriteData, clk, EM_MemWrite, EM_MemRead, Read_Data, first, second, third, fourth, fifth); //correct
MEM_WRB MW(clk, reset, EM_MemtoReg, EM_RegWrite, EM_RD, EM_Result, Read_Data, 
        MW_MemtoReg, MW_RegWrite, MW_RD, MW_Result, MW_Read_Data);

// Stage 5 - Write Back //
//Mux_2x1 muxlast(.A(MW_Read_Data), .B(MW_Result), .S(MW_MemtoReg), .Out(WriteData));
mux2 memreg (MW_Read_Data, MW_Result, MW_MemtoReg, WriteData); //this write data goes back to register file


endmodule
