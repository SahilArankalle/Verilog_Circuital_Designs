module priority_ckt(input [7:0] i, output reg [7:0] h);
always@ (i)
begin
if(i[7])
h[7] = 1;
else if(~i[7] && i[6])
h[6] = 1;
else if(~i[7] && ~i[6] && i[5])
h[5] = 1;
else if(~i[7] && ~i[6] && ~i[5] && i[4])
h[4] = 1;
else if(~i[7] && ~i[6] && ~i[5] && ~i[4] && i[3])
h[3] = 1;
else if(~i[7] && ~i[6] && ~i[5] && ~i[4] && ~i[3] && i[2])
h[2] = 1;
else if(~i[7] && ~i[6] && ~i[5] && ~i[4] && ~i[3] && ~i[2] && i[1])
h[1] = 1;
else if(~i[7] && ~i[6] && ~i[5] && ~i[4] && ~i[3] && ~i[2] && ~i[1] && i[0])
h[0] = 1;
else
h = 8'b0;

end
endmodule 



module binary_encoder(input [7:0] I, output [2:0] y);

wire [7:0] H;
priority_ckt P1 (I,H);

assign y[0] = H[1] | H[3] | H[5] | H[7];
assign y[1] = H[2] | H[3] | H[6] | H[7];
assign y[2] = H[4] | H[5] | H[6] | H[7];

endmodule 
