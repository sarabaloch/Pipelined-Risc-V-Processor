`timescale 1ns / 1ps


module instruction_mem(
input [63:0] Instr_Addr,
output reg [31:0] Instruction
);
reg [7:0] instruction_mem [115:0];
//wire [3:0] passOut = Instr_Addr[3:0];
 //each is 1 byte or 8 bits, there are 16 of them
initial
begin
instruction_mem [0] = 8'b10010011;
instruction_mem [1] = 8'b00000010;
instruction_mem [2] = 8'b00100000;
instruction_mem [3] = 8'b00000000;

instruction_mem [4] = 8'b00010011;
instruction_mem [5] = 8'b00000011;
instruction_mem [6] = 8'b11110000;
instruction_mem [7] = 8'b00000010;

instruction_mem [8] = 8'b10010011;
instruction_mem [9] = 8'b00000011;
instruction_mem [10] = 8'b01100000;
instruction_mem [11] = 8'b00000000;

instruction_mem [12] = 8'b00010011;
instruction_mem [13] = 8'b00000100;
instruction_mem [14] = 8'b00110000;
instruction_mem [15] = 8'b00000001;

instruction_mem [16] = 8'b10010011;
instruction_mem [17] = 8'b00000100;
instruction_mem [18] = 8'b10010000;
instruction_mem [19] = 8'b00000000;

instruction_mem [20] = 8'b00010011;
instruction_mem [21] = 8'b00000101;
instruction_mem [22] = 8'b00000000;
instruction_mem [23] = 8'b00010000;

instruction_mem [24] = 8'b10010011;
instruction_mem [25] = 8'b00000101;
instruction_mem [26] = 8'b01010000;
instruction_mem [27] = 8'b00000000;

//instruction_mem [28] = 8'b00100011;
//instruction_mem [29] = 8'b00100000;
//instruction_mem [30] = 8'b01010101;
//instruction_mem [31] = 8'b00000000;

//instruction_mem [32] = 8'b00100011;
//instruction_mem [33] = 8'b00100010;
//instruction_mem [34] = 8'b01100101;
//instruction_mem [35] = 8'b00000000;

//instruction_mem [36] = 8'b00100011;
//instruction_mem [37] = 8'b00100100;
//instruction_mem [38] = 8'b01110101;
//instruction_mem [39] = 8'b00000000;

//instruction_mem [43] = 8'b00000000;
//instruction_mem [42] = 8'b10000101;
//instruction_mem [41] = 8'b00100110;
//instruction_mem [40] = 8'b00100011;

//instruction_mem [47] = 8'b00000000;
//instruction_mem [46] = 8'b10010101;
//instruction_mem [45] = 8'b00101000;
//instruction_mem [44] = 8'b00100011;

//instruction_mem[51] = 8'b00000000;
//instruction_mem[50] = 8'b00000000;
//instruction_mem[49] = 8'b00001001;
//instruction_mem[48] = 8'b00010011;

//instruction_mem[55] = 8'b00000100;
//instruction_mem[54] = 8'b10111001;
//instruction_mem[53] = 8'b01010000;
//instruction_mem[52] = 8'b01100011;

//instruction_mem[59] = 8'b00000000;
//instruction_mem[58] = 8'b00011001;
//instruction_mem[57] = 8'b00001001;
//instruction_mem[56] = 8'b00010011;

//instruction_mem[63] = 8'b00000000;
//instruction_mem[62] = 8'b00000000;
//instruction_mem[61] = 8'b00000110;
//instruction_mem[60] = 8'b00010011;

//instruction_mem[67] = 8'b00000010;
//instruction_mem[66] = 8'b10110110;
//instruction_mem[65] = 8'b01011000;
//instruction_mem[64] = 8'b01100011;

//instruction_mem[71] = 8'b00000000;
//instruction_mem[70] = 8'b11000110;
//instruction_mem[69] = 8'b00000110;
//instruction_mem[68] = 8'b10110011;

//instruction_mem[75] = 8'b00000000;
//instruction_mem[74] = 8'b11000110;
//instruction_mem[73] = 8'b10000110;
//instruction_mem[72] = 8'b10110011;

//instruction_mem[79] = 8'b00000000;
//instruction_mem[78] = 8'b11000110;
//instruction_mem[77] = 8'b10000110;
//instruction_mem[76] = 8'b10110011;

//instruction_mem[83] = 8'b00000000;
//instruction_mem[82] = 8'b10100110;
//instruction_mem[81] = 8'b10000110;
//instruction_mem[80] = 8'b10110011;

//instruction_mem[87] = 8'b00000000;
//instruction_mem[86] = 8'b00000110;
//instruction_mem[85] = 8'b10100111;
//instruction_mem[84] = 8'b00000011;

//instruction_mem[91] = 8'b00000000;
//instruction_mem[90] = 8'b01000110;
//instruction_mem[89] = 8'b10100111;
//instruction_mem[88] = 8'b10000011;

//instruction_mem[95] = 8'b00000000;
//instruction_mem[94] = 8'b11110111;
//instruction_mem[93] = 8'b01010110;
//instruction_mem[92] = 8'b01100011;

//instruction_mem[99] = 8'b00000000;
//instruction_mem[98] = 8'b11110110;
//instruction_mem[97] = 8'b10100000;
//instruction_mem[96] = 8'b00100011;

//instruction_mem[103] = 8'b00000000;
//instruction_mem[102] = 8'b11100110;
//instruction_mem[101] = 8'b10100010;
//instruction_mem[100] = 8'b00100011;


//instruction_mem[107] = 8'b00000000;
//instruction_mem[106] = 8'b00010110;
//instruction_mem[105] = 8'b00000110;
//instruction_mem[104] = 8'b00010011;

//instruction_mem[111] = 8'b11111100;
//instruction_mem[110] = 8'b00000000;
//instruction_mem[109] = 8'b00001010;
//instruction_mem[108] = 8'b11100011;


//instruction_mem[112] = 8'b11100011;
//instruction_mem[113] = 8'b00000010;
//instruction_mem[114] = 8'b00000000;
//instruction_mem[115] = 8'b11111100;

end

always @ (Instr_Addr) begin
Instruction[7:0] = instruction_mem[Instr_Addr];
Instruction[15:8] = instruction_mem[Instr_Addr+1];
Instruction[23:16] = instruction_mem[Instr_Addr+2];
Instruction[31:24] = instruction_mem[Instr_Addr+3];
end
endmodule