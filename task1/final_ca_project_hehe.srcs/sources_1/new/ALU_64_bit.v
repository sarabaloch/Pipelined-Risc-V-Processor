`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 02:35:04 PM
// Design Name: 
// Module Name: ALU_64_bit
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

module ALU_64_bit(
    input [63:0]a, 
    input [63:0]b,
    input [3:0]ALUop,
    output reg [63:0]Result
    );
    
    always @(*)
    begin 
    
    case (ALUop)
         
        // when AND 
        4'b0000:  
        Result = (a&b);
        
        // when OR
        4'b0001:
        Result = (a|b);
        
        // when Addition
        4'b0010:
        Result = (a+b);

        // when Subtraction
        4'b0110:
        Result = (a-b);

        // when NOR
        4'b1100:
        Result = ~(a|b);
    
        default:
        Result = 64'h0000;
    
    endcase
    end

    
endmodule
