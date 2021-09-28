module dflipflop(d, q, clk);

input d, clk; 
output q;
reg q;
always @ (posedge clk)
begin

q <= d;
end

endmodule

//------------------------------------------------------------
module binarycell(sel, dataIn, rw, clk, dataOut);

input dataIn, clk, sel, rw; 
output dataOut;
wire w1, w2, q;
reg dataOut;

assign w1 = (sel & ~rw);

assign w2 = w1 ? dataIn : dataOut;


dflipflop binflop(w2, q, clk);

always @ ( * ) begin

dataOut <= (sel & q);
end

endmodule

//------------------------------------------------------------
module decoder_4to16(a1, a2, a3, a4, e, dOut);
input  a1, a2, a3, a4, e;
output [15:0] dOut;

assign dOut[0] =  (~a1) & (~a2) &(~a3) & (~a4) & (e);
assign dOut[1] =  (~a1) & (~a2) &(~a3) & (a4) & (e);
assign dOut[2] =  (~a1) & (~a2) &(a3) & (~a4) & (e);
assign dOut[3] =  (~a1) & (~a2) &(a3)  & (a4) & (e);
assign dOut[4] =  (~a1) & (a2) &(~a3) & (~a4) & (e);
assign dOut[5] =  (~a1) & (a2) &(~a3)  & (a4) & (e);
assign dOut[6] =  (~a1) & (a2) &(a3)  & (~a4) & (e);
assign dOut[7] =  (~a1) & (a2) &(a3)  & (a4) & (e);
assign dOut[8] =  (a1) & (~a2) &(~a3) & (~a4) & (e);
assign dOut[9] =  (a1) & (~a2) &(~a3) & (a4) & (e);
assign dOut[10] = (a1) & (~a2) &(a3) & (~a4) & (e);
assign dOut[11] = (a1) & (~a2) &(a3)  & (a4) & (e);
assign dOut[12] = (a1) & (a2) &(~a3) & (~a4) & (e);
assign dOut[13] = (a1) & (a2) &(~a3)  & (a4) & (e);
assign dOut[14] = (a1) & (a2) &(a3)  & (~a4) & (e);
assign dOut[15] = (a1) & (a2) &(a3)  & (a4) & (e);

endmodule

//------------------------------------------------------------
module RamPart(dOut, data, rw, clk,  out);

input [15:0] dOut;
input [7:0] data;
input rw, clk;
output [7:0] out;

wire out0000_1 , out0001_1 , out0010_1 , out0011_1 , out0100_1 , out0101_1 , out0110_1 , out0111_1 , out1000_1 , out1001_1 , out1010_1 , out1011_1 , out1100_1 , out1101_1 , out1110_1 , out1111_1;
wire out0000_2 , out0001_2 , out0010_2 , out0011_2 , out0100_2 , out0101_2 , out0110_2 , out0111_2 , out1000_2 , out1001_2 , out1010_2 , out1011_2 , out1100_2 , out1101_2 , out1110_2 , out1111_2;
wire out0000_3 , out0001_3 , out0010_3 , out0011_3 , out0100_3 , out0101_3 , out0110_3 , out0111_3 , out1000_3 , out1001_3 , out1010_3 , out1011_3 , out1100_3 , out1101_3 , out1110_3 , out1111_3;
wire out0000_4 , out0001_4 , out0010_4 , out0011_4 , out0100_4 , out0101_4 , out0110_4 , out0111_4 , out1000_4 , out1001_4 , out1010_4 , out1011_4 , out1100_4 , out1101_4 , out1110_4 , out1111_4; 
wire out0000_5 , out0001_5 , out0010_5 , out0011_5 , out0100_5 , out0101_5 , out0110_5 , out0111_5 , out1000_5 , out1001_5 , out1010_5 , out1011_5 , out1100_5 , out1101_5 , out1110_5 , out1111_5;
wire out0000_6 , out0001_6 , out0010_6 , out0011_6 , out0100_6 , out0101_6 , out0110_6 , out0111_6 , out1000_6 , out1001_6 , out1010_6 , out1011_6 , out1100_6 , out1101_6 , out1110_6 , out1111_6;
wire out0000_7 , out0001_7 , out0010_7 , out0011_7 , out0100_7 , out0101_7 , out0110_7 , out0111_7 , out1000_7 , out1001_7 , out1010_7 , out1011_7 , out1100_7 , out1101_7 , out1110_7 , out1111_7;
wire out0000_8 , out0001_8 , out0010_8 , out0011_8 , out0100_8 , out0101_8 , out0110_8 , out0111_8 , out1000_8 , out1001_8 , out1010_8 , out1011_8 , out1100_8 , out1101_8 , out1110_8 , out1111_8;
 
//module binarycell(en,data,rw,clk,out);
binarycell cell_0000_1(dOut[0],data[0],rw,clk,out0000_1);
binarycell cell_0001_1(dOut[1],data[0],rw,clk,out0001_1);
binarycell cell_0010_1(dOut[2],data[0],rw,clk,out0010_1);
binarycell cell_0011_1(dOut[3],data[0],rw,clk,out0011_1);
binarycell cell_0100_1(dOut[4],data[0],rw,clk,out0100_1);
binarycell cell_0101_1(dOut[5],data[0],rw,clk,out0101_1);
binarycell cell_0110_1(dOut[6],data[0],rw,clk,out0110_1);
binarycell cell_0111_1(dOut[7],data[0],rw,clk,out0111_1);
binarycell cell_1000_1(dOut[8],data[0],rw,clk,out1000_1);
binarycell cell_1001_1(dOut[9],data[0],rw,clk,out1001_1);
binarycell cell_1010_1(dOut[10],data[0],rw,clk,out1010_1);
binarycell cell_1011_1(dOut[11],data[0],rw,clk,out1011_1);
binarycell cell_1100_1(dOut[12],data[0],rw,clk,out1100_1);
binarycell cell_1101_1(dOut[13],data[0],rw,clk,out1101_1);
binarycell cell_1110_1(dOut[14],data[0],rw,clk,out1110_1);
binarycell cell_1111_1(dOut[15],data[0],rw,clk,out1111_1);


binarycell cell_0000_2(dOut[0],data[1],rw,clk,out0000_2);
binarycell cell_0001_2(dOut[1],data[1],rw,clk,out0001_2);
binarycell cell_0010_2(dOut[2],data[1],rw,clk,out0010_2);
binarycell cell_0011_2(dOut[3],data[1],rw,clk,out0011_2);
binarycell cell_0100_2(dOut[4],data[1],rw,clk,out0100_2);
binarycell cell_0101_2(dOut[5],data[1],rw,clk,out0101_2);
binarycell cell_0110_2(dOut[6],data[1],rw,clk,out0110_2);
binarycell cell_0111_2(dOut[7],data[1],rw,clk,out0111_2);
binarycell cell_1000_2(dOut[8],data[1],rw,clk,out1000_2);
binarycell cell_1001_2(dOut[9],data[1],rw,clk,out1001_2);
binarycell cell_1010_2(dOut[10],data[1],rw,clk,out1010_2);
binarycell cell_1011_2(dOut[11],data[1],rw,clk,out1011_2);
binarycell cell_1100_2(dOut[12],data[1],rw,clk,out1100_2);
binarycell cell_1101_2(dOut[13],data[1],rw,clk,out1101_2);
binarycell cell_1110_2(dOut[14],data[1],rw,clk,out1110_2);
binarycell cell_1111_2(dOut[15],data[1],rw,clk,out1111_2);


binarycell cell_0000_3(dOut[0],data[2],rw,clk,out0000_3);
binarycell cell_0001_3(dOut[1],data[2],rw,clk,out0001_3);
binarycell cell_0010_3(dOut[2],data[2],rw,clk,out0010_3);
binarycell cell_0011_3(dOut[3],data[2],rw,clk,out0011_3);
binarycell cell_0100_3(dOut[4],data[2],rw,clk,out0100_3);
binarycell cell_0101_3(dOut[5],data[2],rw,clk,out0101_3);
binarycell cell_0110_3(dOut[6],data[2],rw,clk,out0110_3);
binarycell cell_0111_3(dOut[7],data[2],rw,clk,out0111_3);
binarycell cell_1000_3(dOut[8],data[2],rw,clk,out1000_3);
binarycell cell_1001_3(dOut[9],data[2],rw,clk,out1001_3);
binarycell cell_1010_3(dOut[10],data[2],rw,clk,out1010_3);
binarycell cell_1011_3(dOut[11],data[2],rw,clk,out1011_3);
binarycell cell_1100_3(dOut[12],data[2],rw,clk,out1100_3);
binarycell cell_1101_3(dOut[13],data[2],rw,clk,out1101_3);
binarycell cell_1110_3(dOut[14],data[2],rw,clk,out1110_3);
binarycell cell_1111_3(dOut[15],data[2],rw,clk,out1111_3);


binarycell cell_0000_4(dOut[0],data[3],rw,clk,out0000_4);
binarycell cell_0001_4(dOut[1],data[3],rw,clk,out0001_4);
binarycell cell_0010_4(dOut[2],data[3],rw,clk,out0010_4);
binarycell cell_0011_4(dOut[3],data[3],rw,clk,out0011_4);
binarycell cell_0100_4(dOut[4],data[3],rw,clk,out0100_4);
binarycell cell_0101_4(dOut[5],data[3],rw,clk,out0101_4);
binarycell cell_0110_4(dOut[6],data[3],rw,clk,out0110_4);
binarycell cell_0111_4(dOut[7],data[3],rw,clk,out0111_4);
binarycell cell_1000_4(dOut[8],data[3],rw,clk,out1000_4);
binarycell cell_1001_4(dOut[9],data[3],rw,clk,out1001_4);
binarycell cell_1010_4(dOut[10],data[3],rw,clk,out1010_4);
binarycell cell_1011_4(dOut[11],data[3],rw,clk,out1011_4);
binarycell cell_1100_4(dOut[12],data[3],rw,clk,out1100_4);
binarycell cell_1101_4(dOut[13],data[3],rw,clk,out1101_4);
binarycell cell_1110_4(dOut[14],data[3],rw,clk,out1110_4);
binarycell cell_1111_4(dOut[15],data[3],rw,clk,out1111_4);

binarycell cell_0000_5(dOut[0],data[4],rw,clk,out0000_5);
binarycell cell_0001_5(dOut[1],data[4],rw,clk,out0001_5);
binarycell cell_0010_5(dOut[2],data[4],rw,clk,out0010_5);
binarycell cell_0011_5(dOut[3],data[4],rw,clk,out0011_5);
binarycell cell_0100_5(dOut[4],data[4],rw,clk,out0100_5);
binarycell cell_0101_5(dOut[5],data[4],rw,clk,out0101_5);
binarycell cell_0110_5(dOut[6],data[4],rw,clk,out0110_5);
binarycell cell_0111_5(dOut[7],data[4],rw,clk,out0111_5);
binarycell cell_1000_5(dOut[8],data[4],rw,clk,out1000_5);
binarycell cell_1001_5(dOut[9],data[4],rw,clk,out1001_5);
binarycell cell_1010_5(dOut[10],data[4],rw,clk,out1010_5);
binarycell cell_1011_5(dOut[11],data[4],rw,clk,out1011_5);
binarycell cell_1100_5(dOut[12],data[4],rw,clk,out1100_5);
binarycell cell_1101_5(dOut[13],data[4],rw,clk,out1101_5);
binarycell cell_1110_5(dOut[14],data[4],rw,clk,out1110_5);
binarycell cell_1111_5(dOut[15],data[4],rw,clk,out1111_5);


binarycell cell_0000_6(dOut[0],data[5],rw,clk,out0000_6);
binarycell cell_0001_6(dOut[1],data[5],rw,clk,out0001_6);
binarycell cell_0010_6(dOut[2],data[5],rw,clk,out0010_6);
binarycell cell_0011_6(dOut[3],data[5],rw,clk,out0011_6);
binarycell cell_0100_6(dOut[4],data[5],rw,clk,out0100_6);
binarycell cell_0101_6(dOut[5],data[5],rw,clk,out0101_6);
binarycell cell_0110_6(dOut[6],data[5],rw,clk,out0110_6);
binarycell cell_0111_6(dOut[7],data[5],rw,clk,out0111_6);
binarycell cell_1000_6(dOut[8],data[5],rw,clk,out1000_6);
binarycell cell_1001_6(dOut[9],data[5],rw,clk,out1001_6);
binarycell cell_1010_6(dOut[10],data[5],rw,clk,out1010_6);
binarycell cell_1011_6(dOut[11],data[5],rw,clk,out1011_6);
binarycell cell_1100_6(dOut[12],data[5],rw,clk,out1100_6);
binarycell cell_1101_6(dOut[13],data[5],rw,clk,out1101_6);
binarycell cell_1110_6(dOut[14],data[5],rw,clk,out1110_6);
binarycell cell_1111_6(dOut[15],data[5],rw,clk,out1111_6);


binarycell cell_0000_7(dOut[0],data[6],rw,clk,out0000_7);
binarycell cell_0001_7(dOut[1],data[6],rw,clk,out0001_7);
binarycell cell_0010_7(dOut[2],data[6],rw,clk,out0010_7);
binarycell cell_0011_7(dOut[3],data[6],rw,clk,out0011_7);
binarycell cell_0100_7(dOut[4],data[6],rw,clk,out0100_7);
binarycell cell_0101_7(dOut[5],data[6],rw,clk,out0101_7);
binarycell cell_0110_7(dOut[6],data[6],rw,clk,out0110_7);
binarycell cell_0111_7(dOut[7],data[6],rw,clk,out0111_7);
binarycell cell_1000_7(dOut[8],data[6],rw,clk,out1000_7);
binarycell cell_1001_7(dOut[9],data[6],rw,clk,out1001_7);
binarycell cell_1010_7(dOut[10],data[6],rw,clk,out1010_7);
binarycell cell_1011_7(dOut[11],data[6],rw,clk,out1011_7);
binarycell cell_1100_7(dOut[12],data[6],rw,clk,out1100_7);
binarycell cell_1101_7(dOut[13],data[6],rw,clk,out1101_7);
binarycell cell_1110_7(dOut[14],data[6],rw,clk,out1110_7);
binarycell cell_1111_7(dOut[15],data[6],rw,clk,out1111_7);


binarycell cell_0000_8(dOut[0],data[7],rw,clk,out0000_8);
binarycell cell_0001_8(dOut[1],data[7],rw,clk,out0001_8);
binarycell cell_0010_8(dOut[2],data[7],rw,clk,out0010_8);
binarycell cell_0011_8(dOut[3],data[7],rw,clk,out0011_8);
binarycell cell_0100_8(dOut[4],data[7],rw,clk,out0100_8);
binarycell cell_0101_8(dOut[5],data[7],rw,clk,out0101_8);
binarycell cell_0110_8(dOut[6],data[7],rw,clk,out0110_8);
binarycell cell_0111_8(dOut[7],data[7],rw,clk,out0111_8);
binarycell cell_1000_8(dOut[8],data[7],rw,clk,out1000_8);
binarycell cell_1001_8(dOut[9],data[7],rw,clk,out1001_8);
binarycell cell_1010_8(dOut[10],data[7],rw,clk,out1010_8);
binarycell cell_1011_8(dOut[11],data[7],rw,clk,out1011_8);
binarycell cell_1100_8(dOut[12],data[7],rw,clk,out1100_8);
binarycell cell_1101_8(dOut[13],data[7],rw,clk,out1101_8);
binarycell cell_1110_8(dOut[14],data[7],rw,clk,out1110_8);
binarycell cell_1111_8(dOut[15],data[7],rw,clk,out1111_8);

assign out[0] = out0000_1 || out0001_1 || out0010_1 || out0011_1 || out0100_1 || out0101_1 || out0110_1 || out0111_1 || out1000_1 || out1001_1 || out1010_1 || out1011_1 || out1100_1 || out1101_1 || out1110_1 || out1111_1;
assign out[1] = out0000_2 || out0001_2 || out0010_2 || out0011_2 || out0100_2 || out0101_2 || out0110_2 || out0111_2 || out1000_2 || out1001_2 || out1010_2 || out1011_2 || out1100_2 || out1101_2 || out1110_2 || out1111_2;
assign out[2] = out0000_3 || out0001_3 || out0010_3 || out0011_3 || out0100_3 || out0101_3 || out0110_3 || out0111_3 || out1000_3 || out1001_3 || out1010_3 || out1011_3 || out1100_3 || out1101_3 || out1110_3 || out1111_3;
assign out[3] = out0000_4 || out0001_4 || out0010_4 || out0011_4 || out0100_4 || out0101_4 || out0110_4 || out0111_4 || out1000_4 || out1001_4 || out1010_4 || out1011_4 || out1100_4 || out1101_4 || out1110_4 || out1111_4;
assign out[4] = out0000_5 || out0001_5 || out0010_5 || out0011_5 || out0100_5 || out0101_5 || out0110_5 || out0111_5 || out1000_5 || out1001_5 || out1010_5 || out1011_5 || out1100_5 || out1101_5 || out1110_5 || out1111_5;
assign out[5] = out0000_6 || out0001_6 || out0010_6 || out0011_6 || out0100_6 || out0101_6 || out0110_6 || out0111_6 || out1000_6 || out1001_6 || out1010_6 || out1011_6 || out1100_6 || out1101_6 || out1110_6 || out1111_6;
assign out[6] = out0000_7 || out0001_7 || out0010_7 || out0011_7 || out0100_7 || out0101_7 || out0110_7 || out0111_7 || out1000_7 || out1001_7 || out1010_7 || out1011_7 || out1100_7 || out1101_7 || out1110_7 || out1111_7;
assign out[7] = out0000_8 || out0001_8 || out0010_8 || out0011_8 || out0100_8 || out0101_8 || out0110_8 || out0111_8 || out1000_8 || out1001_8 || out1010_8 || out1011_8 || out1100_8 || out1101_8 || out1110_8 || out1111_8;

endmodule

//------------------------------------------------------------
module ram(data, rw, clk, out, addr, EN);

input [7:0] addr;
input rw, clk, EN;
input[7:0] data;
output[7:0] out;

wire [7:0] out1, out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13,out14,out15,out16;
wire [15:0] dOut;
wire [15:0] d1_Out;
wire [15:0] d2_Out;
wire [15:0] d3_Out;
wire [15:0] d4_Out;
wire [15:0] d5_Out;
wire [15:0] d6_Out;
wire [15:0] d7_Out;
wire [15:0] d8_Out;
wire [15:0] d9_Out;
wire [15:0] d10_Out;
wire [15:0] d11_Out;
wire [15:0] d12_Out;
wire [15:0] d13_Out;
wire [15:0] d14_Out;
wire [15:0] d15_Out;
wire [15:0] d16_Out;

decoder_4to16 decoder(addr[7], addr[6], addr[5], addr[4], EN, dOut);
decoder_4to16 decoder1(addr[3], addr[2], addr[1], addr[0], dOut[0], d1_Out);
decoder_4to16 decoder2(addr[3], addr[2], addr[1], addr[0], dOut[1], d2_Out);
decoder_4to16 decoder3(addr[3], addr[2], addr[1], addr[0], dOut[2], d3_Out);
decoder_4to16 decoder4(addr[3], addr[2], addr[1], addr[0], dOut[3], d4_Out);
decoder_4to16 decoder5(addr[3], addr[2], addr[1], addr[0], dOut[4], d5_Out);
decoder_4to16 decoder6(addr[3], addr[2], addr[1], addr[0], dOut[5], d6_Out);
decoder_4to16 decoder7(addr[3], addr[2], addr[1], addr[0], dOut[6], d7_Out);
decoder_4to16 decoder8(addr[3], addr[2], addr[1], addr[0], dOut[7], d8_Out);
decoder_4to16 decoder9(addr[3], addr[2], addr[1], addr[0], dOut[8], d9_Out);
decoder_4to16 decoder10(addr[3], addr[2], addr[1], addr[0], dOut[9], d10_Out);
decoder_4to16 decoder11(addr[3], addr[2], addr[1], addr[0], dOut[10],d11_Out);
decoder_4to16 decoder12(addr[3], addr[2], addr[1], addr[0], dOut[11],d12_Out);
decoder_4to16 decoder13(addr[3], addr[2], addr[1], addr[0], dOut[12],d13_Out);
decoder_4to16 decoder14(addr[3], addr[2], addr[1], addr[0], dOut[13],d14_Out);
decoder_4to16 decoder15(addr[3], addr[2], addr[1], addr[0], dOut[14],d15_Out);
decoder_4to16 decoder16(addr[3], addr[2], addr[1], addr[0], dOut[15],d16_Out);

RamPart h1(d1_Out, data, rw, clk, out1);
RamPart h2(d2_Out, data, rw, clk, out2);
RamPart h3(d3_Out, data, rw, clk, out3);
RamPart h4(d4_Out, data, rw, clk, out4);
RamPart h5(d5_Out, data, rw, clk, out5);
RamPart h6(d6_Out, data, rw, clk, out6);
RamPart h7(d7_Out, data, rw, clk, out7);
RamPart h8(d8_Out, data, rw, clk, out8);
RamPart h9(d9_Out, data, rw, clk, out9);
RamPart h10(d10_Out, data, rw, clk, out10);
RamPart h11(d11_Out, data, rw, clk, out11);
RamPart h12(d12_Out, data, rw, clk, out12);
RamPart h13(d13_Out, data, rw, clk, out13);
RamPart h14(d14_Out, data, rw, clk, out14);
RamPart h15(d15_Out, data, rw, clk, out15);
RamPart h16(d16_Out, data, rw, clk, out16);


assign out = out1 | out2 | out3 | out4 | out5 | out6 | out7 | out8 | out9 | out10 | out11 | out12 | out13 | out14 | out15 | out16;

endmodule
