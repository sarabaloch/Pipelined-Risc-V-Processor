`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 21:50:59
// Design Name: 
// Module Name: tbbbbbbb
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


module tbbbbbbb();

reg a; 
reg b; 
reg Out;
Adder(a, b, Out);

initial begin 
a = 64'd108; 
b = -64'd44; 
end

endmodule
