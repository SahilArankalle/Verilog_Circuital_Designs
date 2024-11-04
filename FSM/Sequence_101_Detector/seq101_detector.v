module seq101_detector(seq_in,clk,rst,det_o);

parameter s0 = 2'b00,
			 s1 = 2'b01,
			 s2 = 2'b10,
			 s3 = 2'b11;

input seq_in,clk,rst;
output det_o;

reg [1:0] state, next_state;


always @ (posedge clk, posedge rst)
begin
if(rst)
state <= s0;
else
state <= next_state;
end

always @ (state,seq_in)
begin
case (state)
s0 : 
	if (seq_in==1)
	next_state = s1;
	else
	next_state = s0;
	
s1 :
	if (seq_in==0)
	next_state = s2;
	else
	next_state = s1;

s2 : 
	if (seq_in==1)
	next_state = s3;
	else
	next_state = s0;

s3 :
	if (seq_in==1)
	next_state = s1;
	else
	next_state = s2;
	
default :
	next_state = s0;
endcase
end

assign det_o = (state == s3) ? 1'b1 : 1'b0;

endmodule
