module alu(a, b, cmd, oe, d_out);
input [7:0] a,b;
input [3:0] cmd;
input oe;
output [15:0] d_out;

parameter 	ADD  =	4'b0000, 
				INC  = 	4'b0001,
				SUB  = 	4'b0010,
				DEC  = 	4'b0011,
				MUL  = 	4'b0100,
				DIV  = 	4'b0101,
				SHL  = 	4'b0110,
				SHR  = 	4'b0111,
				AND  = 	4'b1000,
				OR   =	4'b1001,
				INV  = 	4'b1010,
				NAND = 	4'b1011,
				NOR  = 	4'b1100,
				XOR  = 	4'b1101,
				XNOR = 	4'b1110,
				BUF  = 	4'b1111;
				

reg [15:0] out;

always@(cmd,a,b)
	begin
		case(cmd)
		ADD		: out = a + b; 
		INC		: out = a + 1'b1;
		SUB		: out = a - b;
		DEC		: out = a - 1'b1;
		MUL		: out = a * b;
		DIV		: out = a / b;
		SHL		: out = a << 1;
		SHR		: out = a >> 1;
		AND		: out = a && b;
		OR 		: out = a || b;
		INV		: out = !(a);
		NAND		: out = ~(a & b);
		NOR		: out = ~(a | b);
		XOR		: out = a ^ b;
		XNOR		: out = a ~^ b;
		BUF		: out = a;
		endcase
		
end

assign d_out = (oe)? out : 16'hzzzz;

endmodule 

