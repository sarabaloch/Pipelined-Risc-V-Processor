`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 02:41:30 PM
// Design Name: 
// Module Name: data_mem
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

module data_mem(
input [63:0] mem_addr,
input [63:0] write_data,
input clk,
input MemWrite,
input MemRead,
output reg [63:0] read_data,
output [63:0] hehe1,
output [63:0] hehe2,
output [63:0] hehe3,
output [63:0] hehe4,
output [63:0] hehe5
);
 
reg [7:0] data_mem[300:0];
//initial
//begin
//data_mem [0] = 8'b10000011;
//data_mem [1] = 8'b00110100;
//data_mem [2] = 8'b00000101;
//data_mem [3] = 8'b00001111;
//data_mem [4] = 8'b10110011;
//data_mem [5] = 8'b10000100;
//data_mem [6] = 8'b10011010;
//data_mem [7] = 8'b00000000;
//data_mem [8] = 8'b10010011;
//data_mem [9] = 8'b10000100;
//data_mem [10] = 8'b00010100;
//data_mem [11] = 8'b00000000;
//data_mem [12] = 8'b00100011;
//data_mem [13] = 8'b00111000;
//data_mem [14] = 8'b10010101;
//data_mem [15] = 8'b00001110;
//data_mem [16] = 8'b10000011;
//data_mem [17] = 8'b00110100;
//data_mem [18] = 8'b00000101;
//data_mem [19] = 8'b00001111;
//data_mem [20] = 8'b10110011;
//data_mem [21] = 8'b10000100;
//data_mem [22] = 8'b10011010;
//data_mem [23] = 8'b00000000;
//data_mem [24] = 8'b10010011;
//data_mem [25] = 8'b10000100;
//data_mem [26] = 8'b00010100;
//data_mem [27] = 8'b00000000;
//data_mem [28] = 8'b00100011;
//data_mem [29] = 8'b00111000;
//data_mem [30] = 8'b10010101;
//data_mem [31] = 8'b00001110;
//data_mem [32] = 8'b10000011;
//data_mem [33] = 8'b00110100;
//data_mem [34] = 8'b00000101;
//data_mem [35] = 8'b00001111;
//data_mem [36] = 8'b10110011;
//data_mem [37] = 8'b10000100;
//data_mem [38] = 8'b10011010;
//data_mem [39] = 8'b00000000;
//data_mem [40] = 8'b10010011;
//data_mem [41] = 8'b10000100;
//data_mem [42] = 8'b00010100;
//data_mem [43] = 8'b00000000;
//data_mem [44] = 8'b00100011;
//data_mem [45] = 8'b00111000;
//data_mem [46] = 8'b10010101;
//data_mem [47] = 8'b00001110;
//data_mem [48] = 8'b10000011;
//data_mem [49] = 8'b00110100;
//data_mem [50] = 8'b00000101;
//data_mem [51] = 8'b00001111;
//data_mem [52] = 8'b10110011;
//data_mem [53] = 8'b10000100;
//data_mem [54] = 8'b10011010;
//data_mem [55] = 8'b00000000;
//data_mem [56] = 8'b10010011;
//data_mem [57] = 8'b10000100;
//data_mem [58] = 8'b00010100;
//data_mem [59] = 8'b00000000;
//data_mem [60] = 8'b00100011;
//data_mem [61] = 8'b00111000;
//data_mem [62] = 8'b10010101;
//data_mem [63] = 8'b00001110;

integer i;
    initial begin
        for (i=0; i<300; i=i+1) begin
            data_mem[i] = 8'b00000000; 
        end
    end
 
  assign hehe1 = {data_mem[259],data_mem[258],data_mem[257],data_mem[256]};
  assign hehe2 = {data_mem[263], data_mem[262],data_mem[261],data_mem[260]};
  assign hehe3 = {data_mem[267],data_mem[266],data_mem[265],data_mem[264]};
  assign hehe4 = {data_mem[271],data_mem[270],data_mem[269],data_mem[268]};
  assign hehe5 = {data_mem[275],data_mem[274],data_mem[253],data_mem[272]};
 
always @(posedge clk) begin //writing data 
if (MemWrite ==1) begin
    data_mem[mem_addr] = write_data[7:0];
    data_mem[mem_addr+1] = write_data[15:8];
    data_mem[mem_addr+2] = 8'b00000000; //making this change since we are doing sw not sd
    data_mem[mem_addr+3] = 8'b00000000;
end
end
 
always @(mem_addr) begin //read only
if (MemRead ==1) begin
    read_data[7:0] = data_mem[mem_addr];
    read_data[15:8] = data_mem[mem_addr+1];
    read_data[23:16] = 8'b00000000;
    read_data[31:24] =8'b00000000;
    read_data[39:32] =8'b00000000;
    read_data[47:40] =8'b00000000;
    read_data[55:48] = 8'b00000000;
    read_data[63:56] = 8'b00000000;
end
end

endmodule
