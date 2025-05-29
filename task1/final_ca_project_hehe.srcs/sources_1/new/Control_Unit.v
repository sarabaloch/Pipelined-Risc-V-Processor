`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 02:50:09 PM
// Design Name: 
// Module Name: Control_Unit
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

module Control_Unit(
input [6:0] Opcode,
output reg [1:0] ALUOp,
output reg Branch,
output reg MemRead,
output reg MemtoReg,
output reg MemWrite,
output reg ALUSrc,
output reg RegWrite
);

always @ (*) begin
if (Opcode == 7'b0110011) begin
ALUOp = 2'b10;
Branch = 0;
MemRead = 0;
MemtoReg = 0;
MemWrite = 0;
ALUSrc = 0;
RegWrite = 1;
end

else if (Opcode == 7'b0000011) begin
ALUOp = 2'b00;
Branch = 0;
MemRead = 1;
MemtoReg = 1;
MemWrite = 0;
ALUSrc = 1;
RegWrite = 1;
end

else if (Opcode == 7'b0100011) begin
ALUOp = 2'b00;
Branch = 0;
MemRead = 0;
MemtoReg = 1'bX;
MemWrite = 1;
ALUSrc = 1;
RegWrite = 0;
end

else if (Opcode == 7'b1100011) begin
ALUOp = 2'b01;
Branch = 1;
MemRead = 0;
MemtoReg = 1'bx;
MemWrite = 0;
ALUSrc = 0;
RegWrite = 0;
end

else if (Opcode == 7'b0010011) begin
Branch = 0;
MemRead = 0;
MemtoReg = 0;
MemWrite = 0;
ALUSrc = 1;
RegWrite = 1;
ALUOp = 2'b00;
end

end

endmodule
