module tri_state_buffer(input inp, enb, output reg out);

always@(*)
begin
if(enb)
out = inp;
else
out = 1'bz;
end
endmodule

