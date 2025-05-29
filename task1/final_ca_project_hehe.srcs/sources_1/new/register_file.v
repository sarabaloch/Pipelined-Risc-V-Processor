`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 02:32:41 PM
// Design Name: 
// Module Name: register_file
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

module register_file(
    input [63:0] WriteData,
    input [4:0] RS1,
    input [4:0] RS2,
    input [4:0] RD,
    input regWrite,
    input reset,
    input clk,
    
    output reg [63:0] readData1,
    output reg [63:0] readData2
);
    reg [63:0] registers [31:0]; //32 registers of 64 bits, pehle num of bits, then num of registers
    
    integer i;
    initial begin
        for (i=0; i<31; i=i+1) begin
            registers[i] = 0; //randomly adding values
        end
    end
    
    always @ (posedge clk) begin
        if (regWrite==1)
        begin
            registers[RD] = WriteData;
        end
    end
 
    always @ (*) begin
    if (reset) begin
        readData1 = 0;
        readData2 = 0; 
    end
   else
       begin 
        readData1 = registers[RS1];
        readData2 = registers[RS2];
       end
   end
    
endmodule

