module bidirectional_buffer_tb();
wire a,b;
reg ctrl;
integer i;
reg temp1,temp2;

bidirectional_buffer DUT(a,b,ctrl);
initial 
begin
for (i=0;i<8;i=i+1)
begin
{temp1,temp2,ctrl} = i;
#10;
end
#1000 $finish;
end

assign b = ctrl ? temp1 : 1'bz;
assign a = ~ctrl ? temp2 : 1'bz;

initial 
$monitor("a = %b, b = %b, ctrl = %b",a,b,ctrl);
endmodule 
