module priority_ckt_tb();
reg [7:0] x;
wire [2:0] z;

binary_encoder dut (x,z);

integer i;
initial
begin 
x = 8'b0;
#10;
x = 8'b1;
#10;
x = 8'b10;
#10;
x = 8'b11;
#10;
end

endmodule 
