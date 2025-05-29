`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2024 02:27:25 PM
// Design Name: 
// Module Name: imm_data
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


module imm_data(

    input [31:0] instruction, 

    output reg [63:0] imm_data 

    ); 

integer i; //for loop 

always @ (*) begin 

    if (instruction[6] == 1) begin //sb type 

        imm_data[4:0] = instruction[11:7]; 

        imm_data[11:5] = instruction[31:25]; 

        if (imm_data[11] == 0) begin 

            imm_data[63:12] = 0; 

            end 

        else begin
        
            for (i=0; i<52; i=i+1) begin 

                    imm_data[i+12] = 1;  

                    end 
            imm_data[0] = 0; //making it 2's compliment by minusing 1

            end 

        end 

    else begin 

        if (instruction[5] == 0) begin //i type 

            imm_data[11:0] = instruction[31:20]; 

            if (imm_data[11] == 0) begin 

                imm_data[63:12] = 0; 

                end 

            else begin 

                imm_data[63:12] = 1; 

                end 

            end 

        else begin //s type 

            imm_data[4:0] = instruction[11:7]; 

            imm_data[11:5] = instruction[31:25]; 

            if (imm_data[11] == 0) begin 

                    for (i=0; i<52; i=i+1) begin 

                    imm_data[i+12] = 0;  

                    end 

                end 

            else begin 

                    for (i=0; i<52; i=i+1) begin 

                    imm_data[i+12] = 1;  

                    end 

                end 

            end 

        end 

    end 

  

endmodule 
