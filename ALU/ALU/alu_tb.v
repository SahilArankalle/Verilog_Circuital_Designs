module alu_tb();
reg [7:0] a,b;
reg [3:0] cmd;
reg enb;
wire [15:0] out;



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
				
				
reg [4*8:0] string_cmd;

alu dut(a,b,cmd,enb,out);

task initialize;
	begin
	{a,b,cmd,enb} = 0;
	end
endtask


task enb_oe(input i);
	begin
	enb = i;
	end
endtask

task inputs(input [7:0] j,k);
	begin
	a = j;
	b = k;
	end
endtask

task command (input [3:0] l);
	begin
	cmd = l;
	end
endtask

task delay();
	begin
	#10;
	end
endtask


always@(cmd)
	begin
		case(cmd)
				ADD  :	string_cmd = "ADD"; 
				INC  :	string_cmd = "INC";
				SUB  :	string_cmd = "SUB";
				DEC  :	string_cmd = "DEC";
				MUL  :	string_cmd = "MUL";
				DIV  :	string_cmd = "DIV";
				SHL  :	string_cmd = "SHL";
				SHR  :	string_cmd = "SHR";
				AND  :	string_cmd = "AND";
				OR   :	string_cmd = "OR";
				INV  :	string_cmd = "INV";
				NAND :	string_cmd = "NAND";
				NOR  :	string_cmd = "NOR";
				XOR  :	string_cmd = "XOR";
				XNOR :	string_cmd = "XNOR";
				BUF  :	string_cmd = "BUF";
			endcase
		end
		
initial
	begin
	initialize;
	enb_oe(1'b1);
	inputs(8'd10, 8'd10);
	command(AND);
	#10;
	
	inputs(8'd20, 8'd10);
	command(SUB);
	#10;
	
	inputs(8'd10, 8'd10);
	command(MUL);
	#10;
	
	end
	endmodule
	
