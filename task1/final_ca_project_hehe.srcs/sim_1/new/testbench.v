`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2024 02:49:28 PM
// Design Name: 
// Module Name: testbench
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


module testbench();

reg clk;
reg reset;
wire [31:0] Instruction;

Instruction_Fetch testbench(clk,reset,Instruction);

initial
begin

clk = 0;
reset = 1;

#10
reset = 0;

#58
reset = 1;

end

always #5 clk = ~clk;

endmodule
