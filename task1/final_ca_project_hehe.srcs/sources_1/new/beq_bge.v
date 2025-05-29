`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.04.2024 00:09:57
// Design Name: 
// Module Name: beq_bge
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


module beq_bge(
   input [2:0] funct3,
   input [63:0] rd1,
   input [63:0] rd2,
   output reg a
  );
  
  initial
    begin
      a = 0;
    end
  
  always @(*)
	begin
      case (funct3)
        3'b000:
          begin
            if (rd1 == rd2)
              a = 1;
            else
              a = 0;
            end
         3'b100:
    		begin
              if (rd1 < rd2)
              a = 1;
            else
              a = 0;
            end
        3'b101:
          begin
            if (rd1 > rd2)
          	a = 1;
           else
              a = 0;
          end    
      endcase
     end
endmodule
