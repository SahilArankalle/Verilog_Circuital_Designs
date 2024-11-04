module mux4_1behavioral(data,sel,out);
input [3:0] data;
input [1:0] sel;
output reg [3:0] out;


always@(data,sel)
begin
case(sel)
2'd0 : out = data[0];
2'd1 : out = data[1];
2'd2 : out = data[2];
2'd3 : out = data[3];
default : out = 0; 
endcase
end
endmodule 
