
// Aydın DUYGU - 150118981
// Tugay SARICI - 150119829

//-------------------------------------------------------
module onebitsubstractor(input a, input b, input c_in, output c_out, output result);

assign c_out = (~a&b)|(b&c_in)|(~a&c_in);
assign result = (a ^ b) ^ c_in;

endmodule

//-------------------------------------------------------
module twobitsubstractor(input [1:0]a,input [1:0]b, input c_in, output c_out, output  [1:0] result);

wire cout;
onebitsubstractor s0(a[0],b[0],c_in,cout,result[0]);
onebitsubstractor s1(a[1],b[1],cout,c_out,result[1]);

endmodule

//-------------------------------------------------------
module fourbitsubstractor(input [3:0]a,input [3:0]b, input c_in, output c_out, output  [3:0] result);

wire cout;
twobitsubstractor s0(a[1:0],b[1:0],c_in,cout,result[1:0]);
twobitsubstractor s1(a[3:2],b[3:2],cout,c_out,result[3:2]);

endmodule

//-------------------------------------------------------
module eightbitsubstractor(input [7:0]a,input [7:0]b, input c_in, output c_out, output  [7:0] result);

wire cout;
fourbitsubstractor s0(a[3:0],b[3:0],c_in,cout,result[3:0]);
fourbitsubstractor s1(a[7:4],b[7:4],cout,c_out,result[7:4]);

endmodule


//-------------------------------------------------------
module fulladder(
input [7:0] a,
input [7:0] b,
input c_in,
output reg c_out,
output reg [7:0] resultFullAdder);

 
always @(a or b or c_in)
begin 
{c_out, resultFullAdder} = a+b+c_in;
end


endmodule

//-------------------------------------------------------
module mux2to1(in0,in1,sel0,out);

input[7:0] in0,in1;
input sel0;
output[7:0] out;

assign out[7] =  (in0[7] & ~sel0)|(in1[7] & sel0);
assign out[6] =  (in0[6] & ~sel0)|(in1[6] & sel0);
assign out[5] =  (in0[5] & ~sel0)|(in1[5] & sel0);
assign out[4] =  (in0[4] & ~sel0)|(in1[4] & sel0);
assign out[3] =  (in0[3] & ~sel0)|(in1[3] & sel0);
assign out[2] =  (in0[2] & ~sel0)|(in1[2] & sel0);
assign out[1] =  (in0[1] & ~sel0)|(in1[1] & sel0);
assign out[0] =  (in0[0] & ~sel0)|(in1[0] & sel0);

endmodule

//-------------------------------------------------------
module mux4to1(in0,in1,in2,in3,sel0,sel1,out);

input[7:0] in0,in1,in2,in3;
input sel0,sel1;
output[7:0] out;
wire[7:0] w1,w2;

mux2to1 m1(in0,in1,sel0,w1);
mux2to1 m2(in2,in3,sel0,w2);
mux2to1 m3(w1,w2,sel1,out);

endmodule

//-------------------------------------------------------
module mux_8to1(in0,in1,in2,in3,in4,in5,in6,in7,sel0,sel1,sel2,out);

input[7:0] in0,in1,in2,in3,in4,in5,in6,in7;
input sel0,sel1,sel2;
output[7:0] out;
wire[7:0] w1,w2;

mux4to1 m1(in0,in1,in2,in3,sel0,sel1,w1);
mux4to1 m2(in4,in5,in6,in7,sel0,sel1,w2);
mux2to1 m3(w1,w2,sel2,out);

endmodule

//-------------------------------------------------------
module alu(a, b, opSel, zeroF, carryF, negativeF, overflowF, result);

input [7:0] a, b;
input [2:0] opSel; 
output zeroF, negativeF, carryF, overflowF;
output [7:0] result;
wire [7:0] result0, result1, result2, result3, result4, result5, result6, result7;
wire carryFS, carryFA;

fulladder f(a, b, 0, carryFA, result0);
eightbitsubstractor s(a, b, 0, carryFS, result1);
assign result2 = a & b;
assign result3 = a | b;
assign result4 = a;
assign result5 = b << 1;
assign result6 = b >> 1;
assign result7 = a ^ b;


mux_8to1 mux1(result0, result1,result2, result3, result4, result5, result6, result7, opSel[0], opSel[1], opSel[2], result);


assign zeroF = ~(result[7] | result[6] | result[5] | result[4] | result[3] | result[2] | result[1] | result[0]);
assign negativeF = result[7] ;


assign overflowF = (((~a[7] & ~b[7] & result[7]) | (a[7] & b[7] & ~result[7])) & (~opSel[0] & ~opSel[1] & ~opSel[2])) | 
			(((~a[7] & b[7] & result[7]) | (a[7] & ~b[7] & ~result[7])) & (opSel[0] & ~opSel[1] & ~opSel[2]));
			
assign carryF = (~opSel[0] & ~opSel[1] & ~opSel[2] & carryFA) | (opSel[0] & ~opSel[1] & ~opSel[2] & carryFS);
			

endmodule

//-------------------------------------------------------
// FIRST ASSIGNMENT UNTIL HERE
//-------------------------------------------------------

//-------------------------------------------------------
module accumulator(accIn, e, clk, accOut);

input [7:0] accIn;
input e, clk;
output [7:0] accOut;
reg [7:0] accOut;

always @ (posedge clk) begin
if(e == 1)
accOut = accIn;
end
endmodule

//-------------------------------------------------------
module instruction_register(in, d, clk, literal, opcode,instructionType);

// instructionType: 1bit + opcode: 3 bits + value: 8 bits
input [11:0] in;
input d, clk;
output [7:0] literal;
reg [7:0] literal;
output [2:0] opcode;
reg [2:0] opcode;

output instructionType;
reg instructionType;

always @ (posedge clk)
begin
if (d == 1) begin
literal[0] <= in[0];
literal[1] <= in[1];
literal[2] <= in[2];
literal[3] <= in[3];
literal[4] <= in[4];
literal[5] <= in[5];
literal[6] <= in[6];
literal[7] <= in[7];
opcode[0] <= in[8];
opcode[1] <= in[9];
opcode[2] <= in[10];
instructionType<=in[11];
end
end

endmodule

//-------------------------------------------------------
module controlUnit(instructionTypeInput,opcode,clk,state,e,d,f,marEn,writeRam,readRam,r_w,ramEn);


input instructionTypeInput;
input [2:0] opcode;


input clk;
output e,d,f,marEn,writeRam,readRam,r_w,ramEn;

output [1:0] state;
reg [1:0] state = 2'b11;


reg firstRun=1;
reg instructionType;


assign f=(~state[1])&(~state[0]);
assign d=(~state[1])&(state[0]);
assign e=(state[1])&(state[0])&(~instructionType);
assign marEn=((state[1])&(state[0])&instructionType)|(state[1]&~state[0]);
assign writeRam=(instructionType&(opcode[2]&opcode[1]&opcode[0])&((state[1])&(~state[0])));

assign readRam=(instructionType&(~(opcode[2]&opcode[1]&opcode[0])));

assign r_w=(instructionType&(~(opcode[2]&opcode[1]&opcode[0]))&((state[1])&(~state[0])));

assign ramEn=((state[1])&(state[0])&instructionType)|(state[1]&~state[0]);


initial begin
if(firstRun==1) instructionType<=0;
 
 
else instructionType<=instructionTypeInput;
end


always@(*) begin

	if(~state[1]&state[0])begin
		firstRun<=0;
		instructionType<=instructionTypeInput;
		end
		
end
always @ (posedge clk)begin
	
	#10

	state[0]<=(~state[0]&~state[1])|(state[0]&~state[1]&~instructionType)|(instructionType&state[1]&~state[0]);
	state[1]<=(~state[1]&state[0])|(instructionType&state[1]&~state[0]);
	


end

endmodule

//-------------------------------------------------------

module programCounter(clk,f,out);

input clk,f;
output[11:0] out;
reg[11:0] out=12'b111111111111;

always @ (posedge clk)
 
begin

if(f==1) begin
out=out+1;
end
end
endmodule


//-------------------------------------------------------

module mar(clk, in, out, en);


	input clk,en;
	input [7:0] in;
	output [7:0] out;
	reg [7:0] out;

	always @ (posedge clk)
 
		begin

		if(en==1)out<=in;

		end
		
endmodule
//-------------------------------------------------------


module w_d (clk, in, out, en);

	input clk,en;
	input [7:0] in;
	output [7:0] out;
	reg [7:0] out;

	always @ (posedge clk)
 
		begin

		if(en==1)out<=in;

		end
		
endmodule
//-------------------------------------------------------


module r_d (clk, in, out, en);

	input clk,en;
	input [7:0] in;
	output [7:0] out;
	reg [7:0] out;

	always @ (posedge clk)begin


		if(en==1)out<=in;

		end
		
endmodule

//-------------------------------------------------------
module hw4(clk,zeroF, carryF, negativeF, overflowF);

input clk;

wire [11:0] romOut,pcOut;
wire [7:0] literal,aluResult;
wire instructionType;
wire [2:0] opcode;
wire e,d,f;
wire [7:0] marOut,w_d_out,r_d_out,ramOut,muxOut;
wire marEn,readRam,writeRam,r_w,ramEn;

output zeroF, carryF, negativeF, overflowF;
wire [7:0] accOut;


controlUnit myControlUnit(instructionType,opcode,clk,state,e,d,f,marEn,writeRam,readRam,r_w,ramEn);

programCounter pc(clk,f,pcOut);

rom myrom(pcOut,romOut);

instruction_register myInstructionReg(romOut,d, clk, literal, opcode,instructionType);

mar mymar(clk,literal,marOut,marEn);

w_d mywd(clk,accOut,w_d_out,writeRam);

ram myram(w_d_out,r_w,clk,ramOut,marOut,ramEn);

r_d myrd(clk,ramOut,r_d_out,readRam);


mux2to1 mymux(literal,r_d_out,instructionType,muxOut);


alu myALU(muxOut, accOut, opcode, zeroF, carryF, negativeF, overflowF, aluResult);
accumulator myAccumulator(aluResult, e, clk, accOut);

endmodule
