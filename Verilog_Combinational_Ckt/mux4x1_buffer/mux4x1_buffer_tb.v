module mux4x1_buffer_tb();
reg [3:0] in;
reg [1:0] sel;
wire out;
mux4x1_buffer dut(in,sel,out);
integer i;
initial 
begin
in = 4'b1011;
for(i = 0; i < 4; i = i + 1)
begin 
sel = i;
#10;
end
end
endmodule
