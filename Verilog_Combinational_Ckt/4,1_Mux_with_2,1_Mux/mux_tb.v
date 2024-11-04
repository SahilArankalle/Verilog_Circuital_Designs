module mux_tb();
reg a,b,c,d,s0,s1;
wire z;

integer i;

mux4_1 DUT(a,b,c,d,s0,s1,z);
initial 
begin

a = 1'b1;
b = 1'b1;
c = 1'b1;
d = 1'b1;

for(i=0; i<4; i=i+1)
begin
 
{s1,s0} = i;

#10;
end
$finish;
end
endmodule